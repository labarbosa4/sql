# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?
```
•	Type 1: In this case, these privacy concerns are minimized since only the current address is stored, meaning less sensitive data is retained. However, securing this data properly and complying with retention policies is still crucial to avoid keeping unnecessary information.
•	Type 2: this architecture can raise more significant privacy issues because it retains a history of past addresses, which could be seen as sensitive personal information. Regulations usually emphasize data minimization, so holding on to outdated addresses without a valid reason could be problematic. Additionally, customers might request that old data be deleted, which would require careful management.
Overall, the privacy policy must clearly state how long address data is kept, and strong security measures should be in place to safeguard personal information.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. 
```
•	The AdventureWorks OLTP Schema includes tables representing various areas of the company, which can be applied to larger databases and scaled to bigger production companies. This schema enables the distribution of data to achieve diverse objectives, such as cost control, inventory management, and ensuring compliance with human resources privacy policies.
•	The AdventureWorks schema also includes information about the storage of payment methods, which represents a significant responsibility for the company. Ensuring secure handling of this sensitive information will require extra precautions, including robust encryption, compliance with data protection regulations, and regular audits.

Would you change anything in yours?

Something I would have liked to add to my ERD is a clear division by functional areas. This would make the diagram more intuitive for users or viewers, allowing them to easily identify different sections of the database, such as sales, inventory, and customer data. Such an approach would also reduce guesswork and improve efficiency when working with the database by making relationships and data flows more apparent.
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
