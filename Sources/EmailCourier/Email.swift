import Foundation

public struct Email {
    public struct EmailAttachment {
        public var data: Data
        public var mimeType: String
        public var fileName: String
        
        public init(
            data: Data,
            mimeType: String,
            fileName: String
        ) {
            self.data = data
            self.mimeType = mimeType
            self.fileName = fileName
        }
    }
    
    public var recipients: [String]
    public var ccRecipients: [String]?
    public var bccRecipients: [String]?
    public var sender: String?
    public var subject: String?
    public var message: String?
    public var isMessageBodyHTML: Bool
    public var attachments: [EmailAttachment]?
}

public extension Email {
    init(
        recipients: String...,
        ccRecipients: [String]? = nil,
        bccRecipients: [String]? = nil,
        sender: String? = nil,
        subject: String? = nil,
        message: String? = nil,
        isMessageBodyHTML: Bool = false,
        attachments: [EmailAttachment]? = nil
    ) {
        self.recipients = recipients
        self.ccRecipients = ccRecipients
        self.bccRecipients = bccRecipients
        self.sender = sender
        self.subject = subject
        self.message = message
        self.isMessageBodyHTML = isMessageBodyHTML
        self.attachments = attachments
    }
}
