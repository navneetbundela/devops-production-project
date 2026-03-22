# Terraform State Locking

Terraform uses state locking to prevent multiple operations from modifying infrastructure simultaneously.

Modern Terraform versions support native state locking using Amazon S3.

This eliminates the need for DynamoDB tables previously used for state locking.

During a Terraform operation, a lock file is created in the S3 bucket.

Other operations must wait until the lock is released before making changes.