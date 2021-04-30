# EmailCourier

*Just MFMailComposeViewController*

## Create an Email

```swift
let email = Email(
    recipients: "some@email.com",
    sender: "me@email.com",
    subject: "Important Subject!",
    message: "Lorem Ipsum health is wealth buckwheat freekeh corn whole wheat health is wealth parma sheese nutrisoya soy coconut trader joe's lightlife's teese rice dream nut lightlife's smart bacon sheese tofu"
)
```

### [Email init](https://github.com/0xLeif/EmailCourier/blob/542252a9c88e4a49efef0ef12e7165417784aa96/Sources/EmailCourier/Email.swift#L31-L49)

```swift
init(
    recipients: String...,
    ccRecipients: [String]? = nil,
    bccRecipients: [String]? = nil,
    sender: String? = nil,
    subject: String? = nil,
    message: String? = nil,
    isMessageBodyHTML: Bool = false,
    attachments: [EmailAttachment]? = nil
)
```

## Send an Email

```swift
try EmailController(presentingViewController: self).send(email: email)
```
