# The Grug Brained Developer

> Sumber: https://grugbrain.dev/ — URL resmi dari repo penulis (github.com/bigskysoftware/grugbrain.dev)
> Diakses: 2026-08-24
> Catatan: raw text hasil fetch (versi live terbaru), dipadatkan ±50%, bahasa asli "grug speak" dipertahankan, SEMUA bagian artikel direpresentasikan.
>
> **Verifikasi URL:** URL yang diminta (`https://grugq.github.io/blog/grug-brained-dev/`) mengembalikan **404**. Artikel ini BUKAN karya "grugq" (itu orang lain, peneliti OPSEC), melainkan **Carson Gross**, pencipta htmx. URL kanonik: `https://grugbrain.dev/`; source markdown ada di repo GitHub `bigskysoftware/grugbrain.dev` (file `index.md`) — teks di bawah diverifikasi dari sana.
>
> **Catatan bagian:** Versi live TIDAK memiliki heading bernama "apologist" / "spirit of grug" / "complex system rules". Tema-tema itu tetap terjaga lewat: semangat toleransi "is fine!" (Introduction = spirit of grug), kerendahan hati "sadly, often grug himself" + Chesterton's Fence (bukan apologist untuk kompleksitas buatan sendiri), bagian Microservices/Optimizing/Front End (aturan main untuk sistem kompleks), refrain "simple beats complex" (Complexity section + Conclusion).

---

## Introduction

this collection of thoughts on software development gathered by grug brain developer. grug brain developer not so smart, but program many long year and learn some things although mostly still confused. collect learns into small easily digestible page — for you the young grug, and for him too (get older, forget important things like what had for breakfast or if put pants on).

big brained developers are many, some not expected to like this, make sour face. *THINK* they are big brained many many more. (note: grug once think big brained but learn hard way.) **is fine!** free country sort of, end of day not really matter too much.

## The Eternal Enemy: Complexity

apex predator of grug is complexity. complexity bad. say again: complexity *very* bad. *you* say now: complexity *very*, *very* bad.

given choice between complexity or one on one against t-rex, grug take t-rex: at least grug see t-rex.

complexity is spirit demon that enter codebase through well-meaning but ultimately very clubbable non grug-brain developers and project managers who not fear complexity spirit demon or even know about sometime. one day code base understandable and grug can get work done; next day impossible: complexity demon spirit has entered code.

demon mocking him: make change here break unrelated thing there what!?! grug love programming and not becoming shiney rock speculator.

club not work on demon spirit complexity, and bad idea hit developer who let spirit in with club: sometimes grug himself! sadly, often grug himself.

so grug say again and say often: complexity *very*, *very* bad.

## Saying No

best weapon against complexity spirit demon is magic word: **"no"**. "no, grug not build that feature." "no, grug not build that abstraction."

note: good engineering advice but bad career advice — "yes" is magic word for more shiney rock and put in charge of large tribe of developer. sad but true: learn "yes" then learn blame other grugs when fail, ideal career advice. but grug must to grug be true. hard say at first (especially nice grug), easier over time even though shiney rock pile not as high. is ok: how many shiney rock grug really need anyway?

## Saying ok

sometimes compromise necessary (young grugs at home need roof, food). in this situation grug recommend "ok" — then spend time think of **80/20 solution** and build that instead. "80 want with 20 code": maybe little ugly, but work, deliver most value, keep complexity demon at bay.

sometimes best just not tell project manager and do it 80/20 way: easier forgive than permission. project managers mind like butterfly, overworked; often forget what feature supposed to do or move on or quit or get fired.

## Factoring Your Code

one thing grug come to believe: **not factor your application too early!** early on everything very abstract and like water; take time to develop "shape" of system. then, at some point, good cut-points emerge from code base.

good cut point has **narrow interface** with rest of system: small number of functions or abstractions that hide complexity demon internally, like trapped in crystal. best feeling to trap mortal enemy!

watch patiently as cut points emerge and slowly refactor; no hard/fast rule — build skill in seeing. sometimes go too early and get abstractions wrong, so grug bias towards waiting.

big brain developers opposite: invent many abstractions start of project. grug tempted reach for club ("big brain no maintain code!") but learn control passions. instead limit damage early: give them UML diagram (throw away anyway) or demand **working demo tomorrow**. working demo force big brain make something actually work — help see reality on ground. call demo approach "prototype", sound fancier to project manager. prototype early, *especially* if many big brains.

## Testing

grug have love/hate relationship with test: test save grug many uncountable time. unfortunately many **test shamans** exist — make test idol, demand "first test" before grug even write code or have any idea what doing domain! how grug test what grug not even understand domain yet?!

grug instead prefer **write most tests after prototype phase**, when code has begun firm up. but note well: must be very disciplined! easy move on and not write tests because "work on grugs machine" — very very bad: no guarantee work on other machine nor on grug machine in future.

- **Unit tests**: fine, ok, but break as implementation change (much compared api!), make refactor hard, and frankly many bugs happen anyway due interactions with other code. often thrown away when code changes. grug write unit test mostly at start of project, help get going, but not get attached or expect long-term value.
- **End-to-end tests**: good, show whole system work, BUT hard to understand when break, drive grug crazy; sometimes grugs just end up ignoring ("oh that break all time") — very bad!
- **In-between tests** (= integration tests, sweet spot according to grug): high level enough to test correctness of system, low level enough — with good debugger — easy to see what break.

grug focus much ferocious integration test effort **as cut points emerge and system stabilize**: cut point api hopefully stable compared implementation, so integration test remain valuable many long time and easy debug. plus small, well-curated end-to-end suite kept working religiously on pain of clubbing — focus on most common UI features and few most important edge cases, not too many (else impossible maintain and then ignored). this peak grug testing.

also grug **dislike mocking**: only when absolute necessary (rare/never) and coarse grain (cut points/systems) only.

one exception to dislike of "first test": **when bug found** — grug always try first reproduce bug with regression test *then* fix bug. this case only, for some reason work better.

## Agile

agile not terrible, not good; maybe fine. danger however is **agile shaman**: whenever agile project fail, shaman say "you didn't do agile right!" — awfully convenient, then ask more shiney rock for training young grugs on agile. prototyping, tools, and hiring good grugs are better keys to success. grug say **no silver club** fix all software problems no matter what agile shaman say.

## Refactoring

refactoring fine activity, often good idea, especially later in project when code firmed up. HOWEVER many times in career "refactors" go horribly off rails and cause more harm than good. grug notice: **larger refactor, more likely failure**.

so keep refactors relatively small and not "too far out from shore": ideally system work entire time and each step finished before next begins. end-to-end tests are life saver here, but often very hard understand why broke... such is refactor life.

also: introducing **too much abstraction often lead to refactor failure AND system failure**. example J2EE: many big brain sit around thinking too much abstraction, nothing good came of it, many project hurt. another: company grug worked for introduced OSGi to trap complexity demon — not only not help, but make demon much more powerful! took multiple man-year of best developers to rework; features became impossible to implement. very bad!

## Chesterton's Fence

wise grug shaman chesterton once say: fence erected across road — reformer says "I don't see the use of this; let us clear it away." Intelligent answer: "If you don't see the use of it, I certainly won't let you clear it away. Go away and think. Then, when you can come back and tell me that you do see the use of it, I may allow you to destroy it."

many older grug learn lesson well: not start tearing code out willy nilly no matter how ugly look. world is ugly and gronky many times, so also must code be. grug find "oh grug no like look of this, grug fix" lead many hours pain and no better, or system worse even.

not say no improve system ever — quite foolish — but take time understand system first (especially bigger systems), respect code working today even if not perfect. here **tests often good hint for why fence not to be smashed**.

## Microservices

grug wonder why big brain take hardest problem — factoring system correctly — and introduce network call too. seem very confusing to grug.

## Tools

tool and control passion what separate grug from dinosaurs! spend time in new place learning tools: learn tools for two weeks make development often twice faster. IDE code completion allow grug not remember all API (java nearly impossible without!). good debugger worth weight in shiney rocks (and perhaps few children): recommend new programmer learn debugger deeply — conditional break points, expression evaluation, stack navigation teach more about computer than university class often! grug say never be not improving tooling.

## Type Systems

type systems make programming easier. most value: **hit dot on keyboard and list of things grug can do pop up magic — this 90% of value of type system or more**. big brain type-system shamans say type correctness is main point, but those shamans not often ship code; code never shipped is correct, in some sense, but not what grug mean.

caution beware big brains: danger abstraction too high — big brain type system code become astral projection of platonic generic turing model of computation into code base. elegant, but very hard do anything like record number of club inventory for Grug Inc. **generics especially dangerous**: grug try limit generics to container classes where most value add. temptation generics very large is trick! spirit demon complex love this one trick!

## Expression Complexity

grug once liked minimizing lines of code: dense conditional `if(contact && !contact.isActive() && (contact.inGroup(FAMILY) || contact.inGroup(FRIENDS)))`. over time learn this hard debug. prefer:

```js
if(contact) {
  var contactIsInactive = !contact.isActive();
  var contactIsFamilyOrFriends = contact.inGroup(FAMILY) || contact.inGroup(FRIENDS);
  if(contactIsInactive && contactIsFamilyOrFriends) { /* ... */ }
}
```

"EASIER DEBUG! see result of each expression more clearly and good name!" young grugs scream at horror of many line of code, but once calm down they realize grug right.

## DRY

DRY powerful maxim, grug respect, but balance in all things. past ten years grug not as concerned repeat code: so long as repeat code simple and obvious enough, repeat/copy-paste with small variation is often BETTER than many callbacks/closures or elaborate object model — too hard complex for too little benefit at times. experience show repeat code sometimes often better than complex DRY solution.

## Separation of Concerns (SoC)

grug much more sour faced about SoC. canonical example: css/html/js separated in web dev. grug much prefer **locality of behavior (LoB)**: put code ON the thing that do the thing — look at the thing, know what the thing do. with SoC must look all over tarnation many files to understand how button do: much confuse, time waste.

## Closures

closures for the right job: usually abstracting operation over collection of objects. closures like salt (also type systems and generics): small amount go long way, easy spoil things with too much. javascript devs call special demon "callback hell" because too much closure used by js libraries.

## Logging

grug huge fan of logging, encourage lots, especially cloud deployed. funny story: grug saw idol rob pike working on logging at google, thought "what grug do there?!" and skipped it — turn out logging *very* important, so best programmer work on it. don't be such grug brain!

grug tips on logging:
- log all major logical branches within code (if/for)
- if "request" span multiple machines, include request ID in all so logs can be grouped
- make log level dynamically controlled (turn on/off when debugging)
- make log level per user (debug specific user issue)

last two especially handy when fighting bugs in production. invest in getting logging infrastructure "just right" — pays off big. logging needs taught more in schools.

## Concurrency

grug, like all sane developer, **fear concurrency**. rely on simple models as much as possible: stateless web request handlers, simple remote job worker queues where jobs no interdepend. optimistic concurrency seem work well for web stuff. thread local variable occasionally (framework code). some languages have good concurrent data structures (java ConcurrentHashMap) but still need careful work.

## Optimizing

ultra biggest brain once say: "premature optimization is the root of all evil" — grug in humble violent agreement. ALWAYS have concrete real-world perf profile showing specific perf issue before optimizing — never know what actual issue might be, often surprised! beware only-cpu focus: network hit equivalent of many millions cpu cycles, minimize if possible (note well big brain microservice developer!). inexperienced big brain see nested loop and say "O(n^2)? Not on my watch!" — complexity demon spirit smile.

## APIs

good apis not make grug think too much. two reasons apis bad:
1. creators think in terms of implementation/domain of API, rather than use of API
2. creators think too abstract and big brained

better: **design for simple cases with simple api, make complex cases possible** with more complex api — grug call this "layering" apis. also put api ON the thing (object oriented). java worst at this: want `list.filter()`, get interrogated about streams and `Collector<? super T, A, R>`.

## Parsing

grug love make programming language at drop of hat and say **recursive descent** most fun and beautiful way create parser. parser generator tools generate awful snakes nest: impossible understand/debug, hide recursive nature of grammar. production parsers almost always recursive descent despite schools ignoring it! parsing not big brain only magic: so can you! read Bob Nystrom, *Crafting Interpreters* (free online; buy anyway). visitor pattern (trap!).

## The Visitor Pattern

bad.

## Front End Development

"I'll split front end and back end codebase, hot new SPA library talking to GraphQL JSON API over HTTP (funny because not transferring hypertext)" — **now you have two complexity demon spirit lairs**, and front-end demon even more powerful, deep spiritual hold on entire industry — even when website just need put form into database! grug make htmx and hyperscript: keep complexity low, simple HTML, avoid lots javascript (natural ether of spirit complexity demon). react better for job and some applications, but you become acolyte of complexity demon whether you like or no.

## Fads

lots of fads, especially front end. back end more boring because all bad ideas have been tried already. take all revolutionary new approaches with grain salt: big brains working long time on computers, most ideas tried at least once. much time wasted on recycled bad ideas — lots of demon power come from putting new idea willy nilly into code base.

## Fear Of Looking Dumb (FOLD)

very good if **senior grug willing to say publicly: "hmmm, this too complex for grug"**! many developers suffer FOLD; senior saying it makes it ok for junior grugs to admit too complex and not understand (often such case!). FOLD major source of complexity demon power over developers, especially young grugs. take FOLD power away = very good senior grug. be strong! no FOLD!

## Impostor Syndrome

always grug one of two states: ruler of all survey wielding code club like thor, OR no idea what doing. mostly latter, hides it pretty well. despite moderate open source success grug often feel no idea what doing. nature of programming for most grug: feel impostor and be ok — **nobody imposter if everybody imposter**.

## Reads

Worse is Better; Worse is Better is Worse; Is Worse Really Better?; A Philosophy of Software Design.

## Conclusion

*you* say: complexity *very*, *very* bad.
