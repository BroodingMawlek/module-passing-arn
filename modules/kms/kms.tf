data "aws_iam_policy_document" "cmk" {
  version = "2012-10-17"
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}

resource "aws_kms_key" "key" {
  policy = data.aws_iam_policy_document.cmk.json

resource "aws_kms_alias" "key_alias" {
  name          = "alias/kms-key"
  target_key_id = aws_kms_key.key.id
}


