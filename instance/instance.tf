provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_user" "lb_user" {
  user_name = "lb"
}

resource "aws_iam_user_policy" "lb_admin_policy" {
  user_name = aws_iam_user.lb_user.user_name
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "iam:PassRole"  <-- Replace with specific actions
        ],
        "Resource": "*"
      }
    ]
  })
}
