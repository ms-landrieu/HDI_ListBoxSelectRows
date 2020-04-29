
C_OBJECT:C1216($selection)


If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		$selection:=Form:C1466.invoices.query("payment=:1";_payment{_payment})
		
		LISTBOX SELECT ROWS:C1715(*;"Invoices";$selection;lk replace selection:K53:1)
		OBJECT SET VISIBLE:C603(*;"NewCommand";True:C214)
		
		manageTexts 
		
End case 

