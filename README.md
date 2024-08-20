# Kura Labs Cohort 5- Deployment Workload 2
## CICD with AWS CLI:


## Documentation
I began with Step 3, creating a t2.micro EC2 for the Jenkins Server using instructions from Workload 1, so I could have a terminal to work with. I added the following security groups with source 0.0.0.0/0 to the inbound rules, which essentially allows traffic from any IP address so it’s accessible to the public. 

TCP 22 (SSH Access): Allows Secure Shell (SSH) access to the EC2 instance, enabling remote management.

TCP 80 (HTTP): Allows web traffic to reach a web server running on the instance, such as Apache or Nginx, which typically listens on port 80.

TCP 8080 (Jenkins): Allows access to Jenkins, an automation server often used for continuous integration/continuous deployment (CI/CD) pipelines. Jenkins commonly runs on port 8080.

For step 2F (Create AWS Access Keys), I went with CLI for the use case since the type was not specified in the directions.

The BASH script "system_resources_test.sh" that checks for system resources (specifically memory and disk space) using conditional statements and exit codes (0 or 1) if any resource exceeds a certain threshold. At first, I set the threshold to 80 but the exit code would get activated later in the process so I changed the threshold to 90 and it seemed to fix the issue.

Exit codes are crucial in CI/CD pipelines because they provide a simple and effective way to determine the outcome of each stage in the pipeline. They help automate decision-making, ensure that only successful operations are promoted, and provide quick feedback to developers, contributing to a more reliable and efficient development process.

Install AWS CLI on the Jenkins Server:

The CLI enables Jenkins to push code to AWS services, start deployments, or retrieve deployment statuses. If you're using EC2 instances for hosting your application, the CLI could be used to perform rolling updates by creating new instances with the updated application and then terminating the old ones. Jenkins can scale AWS resources based on demand by invoking CLI commands to modify the auto-scaling groups or launch new instances.

Switch to the jenkins user by running:
sudo su - jenkins

Activate the Python Virtual Environment
source venv/bin/activate

A Python virtual environment is an isolated environment that allows you to install and manage Python packages and dependencies for a specific project without affecting the global Python installation or other projects on the same machine. It essentially creates a self-contained directory that contains its own installation of Python, along with any libraries or dependencies you install while the environment is active. This particular venv was created when running the JenkinsFile in the build section of the code.

## How a Deploy Stage in the CI/CD Pipeline Increases Business Efficiency
1. Speed and Consistency:
	Faster Deployments: Automating the deployment process reduces the time it takes to push new features, updates, or bug fixes to production. This enables quicker responses to market demands or customer feedback, increasing the business's ability to adapt and innovate.
	Continuous Delivery: A deploy stage in the CI/CD pipeline enables continuous delivery of software, ensuring that new code can be released to production as soon as it’s ready, without manual intervention. This improves the overall time-to-market.
	Reducing Human Error: Automated deployments reduce the risk of mistakes that can occur during manual deployments (misconfigurations, missing steps, or incorrect environments)
	Standardized Process: A deploy stage ensures that every deployment follows the same process, adhering to best practices and compliance requirements.
2. Scalability:
	Handling Multiple Deployments: With automation, the business can easily scale its operations to handle multiple deployments across different environments or services without a proportional increase in effort or complexity.
	Resource Optimization: Automated deployments can be scheduled or triggered based on specific conditions, ensuring that resources are used efficiently, and downtime is minimized.
3. Enhanced Collaboration and Communication:
	Improved Developer Productivity: By automating deployments, developers spend less time on manual tasks and more time on writing code and innovating, boosting overall productivity!
	Clearer Communication: Automated pipelines often include notifications and logging, ensuring that all stakeholders are informed of deployment statuses and any issues that arise. This transparency improves collaboration across teams.
## Potential Issues with Automating Source Code Deployment to Production
1. Configuration Drift:
	Issue: Over time, differences can arise between the configurations of development, staging, and production environments, leading to inconsistencies that can cause deployment failures.
	Resolution: Use Infrastructure as Code (IaC) tools like Terraform or AWS CloudFormation to manage environment configurations consistently across all stages. Ensure that the pipeline includes steps to validate and sync configurations across environments before deployment.
2. Lack of Human Oversight:
	Issue: Fully automated pipelines can sometimes lead to a lack of human oversight, where critical business decisions or last-minute checks are bypassed, potentially leading to issues in production.
	Resolution: Introduce manual approval stages in the pipeline for critical deployments, where a human can review and approve the deployment before it proceeds. This is particularly important for high-risk changes or deployments during sensitive periods (e.g., peak business hours).

![WL2ver3 drawio](https://github.com/user-attachments/assets/af2985f1-6ee5-4686-92a1-449c4e052652)

