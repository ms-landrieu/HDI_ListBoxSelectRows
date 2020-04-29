

C_COLLECTION:C1488($collection)


If (btnTrace)
	TRACE:C157
End if 


$collection:=Form:C1466.payments.query("min <= :1 and max >= :1";Num:C11(Form:C1466.amount))
LISTBOX SELECT ROWS:C1715(*;"Payments";$collection;lk replace selection:K53:1)

OBJECT SET VISIBLE:C603(*;"SelectRowsCollection";True:C214)
OBJECT SET VISIBLE:C603(*;"UnselectRowsCollection";False:C215)

manageTexts 