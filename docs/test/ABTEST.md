## A/B Tests

**A/B Test Name:** Welcome starting page or straight to login

**User Story Number:** US1 and US2

**Metrics:** Happiness and user retention

**Hypothesis:** Many users probably want to jump straight into the action; immediately being
prompted to login upon opening the app and being taken straight to the features to use
after logging in. However, users might like the app having a home page with a design (logo)
on it upon opening the app, from which they can press a button to login. This could also
provide us somewhere open to give access to things we want user to see, like a way to
take the NPS survey. This could also lead to us getting more NPS answers.

**Experiment:** Half of users will recieve a welcome screen when they open the app. The other
half will be taken straight to the login page. User retention (users who continue to login
over a span of time) and happiness (most likely from NPS) will be checked between the 2 sample
groups.

**Variations:** The starting screen would have the logo of the company, some kind of logo text,
and then buttons to take them to login, sing up, and the NPS survey. The non-starting screen
version will being users on a login page with the logo and a button to take them to a separate
sign up page if they need it.

---

**A/B Test Name:** List organization

**User Story Number:** US4

**Metrics:** User retention and happiness

**Hypothesis:** Users may prefer one central navigation system, as opposed to a 2 tier system with sub navigation tools. For example in our current app version we have one page that contains both the shopping list and pantry list of the user. these are selected by tabs on the top of the screen. however users may want two seperate screens on the main nav bar at the bottom of the page.

**Experiment:** Half of users will have one screen containing both lists, the other half will have two screens each containing one of the lists. We then track the users retention metrics during their use. If users are retained for a couple of days they will be prompted with a survey asking if they would prefer the other configuration, this data can then be collected and used to guage opinions.


**Variations:** one layout has both lists on the same page, organized in a task bar. the other layout has two different screens both with their own single list and no navigational tab bar at the top of each page.

---

**A/B Test Name:** Tutorial After Signup

**User Story Number:** US1 amd US2

**Metrics:** Adoption, user retention, task success

**Hypothesis:** Offering an interactive tutorial will result in higher user engagement, task success, and adoption rates than a static, text-based tutorial. If users can interact with the interface during the onboarding process, they are more likely to understand the product features and feel confident using the app, which will improve retention.

**Experiment:** This experiment compares two onboarding approaches: an interactive tutorial (Variation A) where users complete tasks within the app, and a static tutorial (Variation B) with text and screenshots. We’ll track completion rates, task success, and 7-day retention using Firebase Analytics to see which method better engages users and reduces early churn. The goal is to determine if hands-on interaction improves adoption and retention compared to a passive walkthrough.

**Variations:** Variation A will include an interactive tutorial with guided, in-app actions. Variation B will include a static tutorial with text/screenshots and “Next” buttons.


---
**A/B Test Name**: Recipe Information Display

**User Story Number**: US4

**Metrics**: User engagement

**Hypothesis**: Presenting each recipe with a unique visual style could make each recipe more memorable and encourage users to explore a variety of recipes. A unique style may enhance users' enjoyment and interest, prompting them to spend more time viewing recipes and improve recall of recipe details. Alternatively, a uniform style across all recipes might make it easier to browse, compare, and focus on the content without visual distractions.

**Experiment**: Users will be divided into two groups. One group will view recipes displayed with unique styles for each recipe (e.g., different colors, fonts, or layout styles), providing a visually distinct experience for each. The second group will see recipes displayed with a uniform style, where all recipes have the same colors, fonts, and layout. We’ll measure user engagement (number of recipes saved) to determine the impact of each approach on user experience.

**Variations**:
- **Unique Style Display**: Each recipe is shown with a distinct design, incorporating varied colors, fonts, and layouts to give each recipe a unique visual appeal.
- **Uniform Style Display**: All recipes are displayed with a consistent style, using the same colors, fonts, and layout, ensuring a streamlined and uniform browsing experience.

