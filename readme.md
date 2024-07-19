Markdown
# AWS Config: Ensuring Compliance and Resource Management in AWS

[![AWS Config Architecture](aws-config-architecture.png)](aws-config-architecture.png) 

AWS Config is a powerful service that helps you assess, audit, and evaluate the configurations of your AWS resources. It continuously monitors and records your AWS resource configurations, enabling you to:

* **Build Compliance Rules:** Define rules to check if your resources adhere to your organization's security and compliance standards.
* **Inventory Resources:** Maintain a detailed inventory of your resources across AWS regions and accounts.
* **Track Changes:** Monitor changes to your resources over time and investigate configuration history.

## How AWS Config Works

AWS Config simplifies governance and compliance by providing visibility into your AWS resources. Here's how it operates:

1. **Configuration Recorder:**  
   * Continuously records the configuration details of your AWS resources, such as EC2 instances, S3 buckets, security groups, and more.
   * Captures changes to these resources, creating a timeline of configuration history.

2. **Config Rules:**
   * **Managed Rules:** Pre-built rules provided by AWS to check for common compliance issues (e.g., S3 public access, unencrypted EBS volumes).
   * **Custom Rules:** Rules you can create to enforce specific configurations tailored to your organization's policies.
   * **Evaluation:** Config Rules evaluate your resource configurations against the defined rules and determine compliance status.

3. **Delivery Channel:**
   * **S3 Bucket:** Stores configuration snapshots and compliance history for analysis and auditing.
   * **SNS Topic:** Sends notifications when resources become non-compliant or undergo changes.

4. **Remediation Actions (Optional):**
   * **Systems Manager Automation:**  Automatically fix non-compliant resources based on predefined actions.
   * **Lambda Functions:**  Execute custom logic to remediate or trigger other actions based on compliance events.

## Use Case: Enforcing Compliance and Auditing in a Multi-Account Environment

Let's imagine you are a managed service provider (MSP) managing multiple AWS accounts for different clients. Here's how AWS Config can benefit you:

* **Centralized Governance:** Define and enforce standardized security and compliance policies across all client accounts.
* **Compliance Reporting:** Generate detailed reports to demonstrate compliance with industry regulations or internal standards.
* **Proactive Security:** Identify and remediate security vulnerabilities before they are exploited.
* **Cost Optimization:**  Track resource utilization and identify opportunities for cost savings.
* **Change Tracking:** Maintain an audit trail of configuration changes for troubleshooting and analysis.

## Terraform Implementation

This Terraform project sets up AWS Config rules to monitor and enforce two critical compliance checks:

1. **S3 Public Access:** Prevent accidental exposure of sensitive data by detecting and reporting S3 buckets that are publicly accessible.
2. **RDS Instance Termination:** Ensure the availability and durability of critical databases by detecting and reporting RDS instances that have deletion protection disabled.

### Project Structure
### Modules

* **`config_rule_s3_public_access`:**  Defines and manages the AWS Config rule to check for public S3 buckets.
* **`config_rule_rds_termination`:** Defines and manages the AWS Config rule to check for RDS instances with disabled deletion protection.


### Example Pricing (For Our Use Case)

* **Configuration Items:**
    * 6 resources/account (2 S3 + 4 RDS) * 10 accounts = 60 resources
    * 60 resources * $0.003/resource = $0.18 per region

* **Config Rules:**
    * 2 rules * 60 resources/rule * $0.001/evaluation = $0.12 per region

* **Estimated Total Cost (per region):** $0.18 + $0.12 = $0.30

**Note:** Actual costs may vary. See the [AWS Config pricing page](https://aws.amazon.com/config/pricing/) for details.

## Getting Started

1. **Clone:** `git clone <repository-url>`
2. **Initialize:** `terraform init`
3. **Customize (Optional):** Modify `variables.tf` and `iam_policy.json` as needed.
4. **Plan and Apply:** `terraform plan` and `terraform apply`

## Important Considerations:

* **Remediation:** Implement automated remediation for efficient compliance enforcement.
* **Notifications:** Integrate with Amazon SNS to receive timely alerts.
* **Custom Rules:** Create tailored rules with AWS Lambda for specific use cases.