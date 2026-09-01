from playwright.sync_api import sync_playwright
import sys

def check(label, cond):
    status = "PASS" if cond else "FAIL"
    print(f"[{status}] {label}")

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page(viewport={"width": 1280, "height": 800})
    errors = []
    page.on("console", lambda m: errors.append(m.text) if m.type == "error" else None)
    page.on("pageerror", lambda e: errors.append(str(e)))

    # ===== INDEX PAGE =====
    page.goto("http://localhost:8765/index.html")
    page.wait_for_load_state("networkidle")
    check("index: title", "MFahri_S" in page.title())
    check("index: hero h1", page.locator("h1").first.is_visible())
    featured = page.locator("#featured-grid .card")
    check("index: 3 featured cards", featured.count() == 3)
    check("index: nav links", page.locator(".nav-link").count() >= 4)

    # Theme toggle test
    root_class = page.evaluate("document.documentElement.className")
    is_dark = "light" not in root_class
    print(f"  -> initial theme: {'dark' if is_dark else 'light'}")
    page.click("#theme-toggle")
    page.wait_for_timeout(100)
    toggled = page.evaluate("document.documentElement.classList.contains('light')")
    check("index: theme toggle works", toggled != is_dark)
    # reset
    if toggled:
        page.click("#theme-toggle")

    page.screenshot(path="/tmp/mfahri_index.png", full_page=False)

    # ===== BLOG PAGE =====
    page.goto("http://localhost:8765/blog.html")
    page.wait_for_load_state("networkidle")
    cards = page.locator("#blog-grid .card")
    check("blog: 8 cards rendered", cards.count() == 8)
    filters = page.locator(".filter-btn")
    check("blog: 6 filters", filters.count() == 6)
    page.screenshot(path="/tmp/mfahri_blog.png", full_page=False)

    # Filter test
    page.click(".filter-btn[data-category='tutorial']")
    page.wait_for_timeout(200)
    tutorial_cards = page.locator("#blog-grid .card")
    check("blog: tutorial filter -> 3 cards", tutorial_cards.count() == 3)

    page.click(".filter-btn[data-category='journal']")
    page.wait_for_timeout(200)
    journal_cards = page.locator("#blog-grid .card")
    check("blog: journal filter -> 2 cards", journal_cards.count() == 2)

    # ===== POST DETAIL =====
    page.goto("http://localhost:8765/post.html?slug=belajar-css-grid")
    page.wait_for_load_state("networkidle")
    check("post: title rendered", "CSS Grid" in page.content())
    check("post: h2 content", page.locator(".post-body h2").count() >= 1)
    check("post: related posts", page.locator(".related-card").count() >= 1)
    check("post: toc", page.locator(".toc a").count() >= 1)
    page.screenshot(path="/tmp/mfahri_post.png", full_page=False)

    # invalid slug -> 404
    page.goto("http://localhost:8765/post.html?slug=tidak-ada")
    page.wait_for_load_state("networkidle")
    check("post: 404 for bad slug", "404" in page.locator(".not-found").inner_text())

    # ===== ABOUT =====
    page.goto("http://localhost:8765/about.html")
    page.wait_for_load_state("networkidle")
    check("about: timeline items", page.locator(".timeline-item").count() >= 5)
    check("about: skills cards", page.locator(".skill-card").count() == 4)
    page.screenshot(path="/tmp/mfahri_about.png", full_page=False)

    # ===== CONTACT =====
    page.goto("http://localhost:8765/contact.html")
    page.wait_for_load_state("networkidle")
    check("contact: form exists", page.locator("#contact-form").count() == 1)
    check("contact: methods", page.locator(".contact-method").count() == 4)
    page.screenshot(path="/tmp/mfahri_contact.png", full_page=False)

    # Form validation
    page.click("#contact-form button[type=submit]")
    page.wait_for_timeout(200)
    err_groups = page.locator(".form-group.has-error")
    check("contact: validation shows errors", err_groups.count() >= 2)

    # ===== MOBILE MENU =====
    mobile = browser.new_page(viewport={"width": 375, "height": 700})
    mobile.goto("http://localhost:8765/index.html")
    mobile.wait_for_load_state("networkidle")
    menu_btn = mobile.locator("#menu-toggle")
    check("mobile: menu visible", menu_btn.is_visible())
    mobile.click("#menu-toggle")
    mobile.wait_for_timeout(300)
    check("mobile: nav opens", mobile.locator("#main-nav").evaluate("el => el.classList.contains('active')"))
    mobile.screenshot(path="/tmp/mfahri_mobile.png", full_page=False)

    print("\n--- JS errors ---")
    js_errors = [e for e in errors if "favicon" not in e and "boxicons" not in e]
    for e in js_errors[:10]:
        print("  ERROR:", e)
    check("no JS console errors", len(js_errors) == 0)

    browser.close()