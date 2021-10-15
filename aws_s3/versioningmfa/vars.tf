variable "tag_name" {
	type 		= string
}

variable "bucket_name" {
	type 		= string
	description = "Applying MFA and Versioning on this bucket"
}

variable "is_version" {
	type 		= bool
	default		= true
	description = "Want to unable versioning?"
}

variable "is_mfa" {
	type 		= bool
	default		= true
	description = "Want to unable MFA?"
}

variable "acl" {
	type 		= string
	default		= "private"
	description = "Bucket-owner-full-control canned access control list"
}

variable "tfstate" {
	type 		= string
	default		= "tfstate_files/"
	description = "Folder for terraform state file"
}

