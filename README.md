# Tuition Reimbursement

### Purpose:
This is a complete replacement of a ColdFusion application in Ruby on Rails. This application checks whether a user is eligible to use the UNMH Employee benefit of Tuition Reimbursement and manages workflows for these requests.

The user/employee creates an educational goal, which includes what education institution they are/will be attending, what degree they are pursuing (associate, bachelor, master's, etc), and the specific program credential (like A.A. Associate of Arts, B.N. Bachelor of Nursing, etc). HR Benefits team reviews and approves or rejects these educational goals.

Once an educational goal has been created, an eligible employee can create a course reimbursement request. Their assigned manager (in Lawson) will be notified by automatic email to review this request.

Users can upload the documents required by policy, which are then reviewed by the HR Benefits team. Once all policy requirements are met, a reimbursement is determined by the benefits team and the employee receives this money in their next paycheck.

#### App Cat Listing: https://appcat.uhapps.health.unm.edu/cat_applications/866/edit

## Tech Stack Details

###Ruby v. 2.7.2
###Rails v. 6.0.4

###Database Info:
- multidb setup from template;
- Dev/Staging: shared MS SQL db
- Prod: MS SQL db
- External DB Connection: Emp_All / HR Payroll DB (Oracle)
  - *See Employee Model for more information*
  - Required for determining employee eligibility for benefit
  - Also determines who is the employee's manager for approving course reimbursement requests


### Database Strucutre (ERD):
![](tuitrem_erd.png)
