# Sumber mentah — Guidelines for Human-AI Interaction (Microsoft HAX)

> Dari: microsoft.com/en-us/haxtoolkit/ai-guidelines/ + poster resmi
> aka.ms/aiguidelines (CHI 2019 paper: Amershi et al., "Guidelines for Human-AI Interaction").
> Disimpan Agustus 2026. Ringkasan analisis di `../16-desain-produk-ai.md`.

## Initially

1. **Make clear what the system can do.** Help the user understand what the AI system is capable of doing.
2. **Make clear how well the system can do what it can do.** Help the user understand how often the AI system may make mistakes.

## During interaction

3. **Time services based on context.** Know when to act or interrupt the user based on the current task and environment.
4. **Show contextually relevant information.** Display information relevant to the user's current task and environment.
5. **Match relevant social norms.** Ensure the experience respects the cultural and social norms of the given context.
6. **Mitigate social biases.** Avoid reinforcing negative stereotypes and biases in language and behavior.

7. **Support efficient invocation.** Make it easy to invoke or request the AI system's services when needed.
8. **Support efficient dismissal.** Make it easy to dismiss or ignore undesired system services.
9. **Support efficient correction.** Make it easy to edit, refine, or recover when the AI system is wrong.
10. **Scope services when in doubt.** Engage in disambiguation or gracefully degrade the AI system's services when uncertain about the user's goals.

## When wrong

11. **Make clear why the system did what it did.** Help the user understand why the AI system acted as it did.

## Over time

12. **Remember recent interactions.** Maintain short-term memory of recent interactions to improve efficiency.
13. **Learn from user behavior.** Personalize the experience by learning from user actions over time.
14. **Update and adapt cautiously.** Update and adapt AI system behavior cautiously, while avoiding disruptive changes.
15. **Encourage granular feedback.** Encourage regular user feedback on the AI system's behaviors in interaction.
16. **Convey the consequences of user actions.** Immediately update the AI system's model based on user actions, and convey these updates to users.
17. **Provide global controls.** Let the user globally customize what the AI system does and monitors at a high level.
18. **Notify users about changes.** Notify users about changes to the AI system's capabilities and functions over time.

## Toolkit terkait (resmi)

- HAX Design Library — pattern & contoh implementasi per guideline (filter: initial / during / wrong / over time)
- HAX Workbook — sesi prioritisasi guideline untuk tim
- HAX Playbook — generator skenario kegagalan NLP untuk prototyping
