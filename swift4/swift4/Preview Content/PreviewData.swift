//
//  PreviewData.swift
//  swift4
//
//  Created by David King on 6/23/22.
//

import Foundation

var transactionPreviewData:Transaction = Transaction(id: 1, date: "01/01/2020", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 001, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
