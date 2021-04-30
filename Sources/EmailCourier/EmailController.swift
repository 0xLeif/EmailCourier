import MessageUI

public class EmailController: MFMailComposeViewController {
    public enum EmailError: Error {
        case canNotSendMail
    }
    
    public let presenter: UIViewController
    
    public weak var mailDelegate: MFMailComposeViewControllerDelegate?
    
    public init(
        presentingViewController: UIViewController,
        delegate: MFMailComposeViewControllerDelegate? = nil
    ) {
        self.presenter = presentingViewController
        self.mailDelegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension EmailController {
    func send(email: Email) throws {
        guard EmailController.canSendMail() else {
            throw EmailError.canNotSendMail
        }
        
        mailComposeDelegate = mailDelegate ?? self
        
        setToRecipients(email.recipients)
        
        if let ccRecipients = email.ccRecipients {
            setCcRecipients(ccRecipients)
        }
        
        if let bccRecipients = email.bccRecipients {
            setBccRecipients(bccRecipients)
        }
        
        if let sender = email.sender {
            setPreferredSendingEmailAddress(sender)
        }
        
        if let subject = email.subject {
            setSubject(subject)
        }
        
        if let message = email.message {
            setMessageBody(message, isHTML: email.isMessageBodyHTML)
        }
        
        email.attachments?.forEach { attachment in
            addAttachmentData(attachment.data,
                              mimeType: attachment.mimeType,
                              fileName: attachment.fileName)
        }
        
        presenter.present(self, animated: true)
    }
}

extension EmailController: MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        presenter.dismiss(animated: true)
    }
}

