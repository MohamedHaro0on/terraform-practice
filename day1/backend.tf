terraform{ 
    backend "s3" {
        bucket = "mohamed-haroon-terraform-s3-bucket"
        key = "terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        # profile = " Profile here for the credentials of the s3 bucket wether on gcp or aws"
    }
}