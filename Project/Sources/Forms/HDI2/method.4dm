C_LONGINT:C283($i;_TabTitles)
C_BOOLEAN:C305(btnTrace)
C_OBJECT:C1216($item)

If (btnTrace)
	TRACE:C157
End if 


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		_TabTitles:=New list:C375
		ARRAY TEXT:C222(_Descriptions;0)
		ARRAY TEXT:C222(_TabLineCode;0)
		
		READ ONLY:C145([INFOS:1])
		
		QUERY:C277([INFOS:1];[INFOS:1]PageNumber:4;"<=";9)
		ORDER BY:C49([INFOS:1];[INFOS:1]PageNumber:4;>)
		SELECTION TO ARRAY:C260([INFOS:1]Description:2;_Descriptions)
		
		For ($i;1;Records in selection:C76([INFOS:1]))
			GOTO SELECTED RECORD:C245([INFOS:1];$i)
			APPEND TO LIST:C376(_TabTitles;[INFOS:1]TabTitle:3;$i)
		End for 
		
		QUERY:C277([INFOS:1];[INFOS:1]PageNumber:4;">=";10)
		ORDER BY:C49([INFOS:1];[INFOS:1]PageNumber:4;>)
		SELECTION TO ARRAY:C260([INFOS:1]Description:2;_TabLineCode)
		
		Form:C1466.invoices:=ds:C1482.Invoices.all()
		
		ARRAY TEXT:C222(_payment;3)
		_payment{1}:="Cash"
		_payment{2}:="Credit card"
		_payment{3}:="Check"
		
		viewTrace 
		manageTexts 
		RW 
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		viewTrace 
		
		  //Page 2
		_payment:=0
		_payment{0}:="Select a payment method"
		OBJECT SET VISIBLE:C603(*;"NewCommand";False:C215)
		LISTBOX SELECT ROWS:C1715(*;"Invoices";ds:C1482.Invoices.newSelection();lk replace selection:K53:1)
		
		
		  //Page 3
		Form:C1466.payments:=New collection:C1472
		$item:=New object:C1471("means";"Cash";"min";100;"max";500)
		Form:C1466.payments.push($item)
		$item:=New object:C1471("means";"Check";"min";200;"max";1200)
		Form:C1466.payments.push($item)
		$item:=New object:C1471("means";"Credit card";"min";700;"max";1500)
		Form:C1466.payments.push($item)
		$item:=New object:C1471("means";"Gift card";"min";800;"max";900)
		Form:C1466.payments.push($item)
		
		Form:C1466.amount:=250
		
		LISTBOX SELECT ROWS:C1715(*;"Payments";New collection:C1472;lk replace selection:K53:1)
		OBJECT SET VISIBLE:C603(*;"SelectRowsCollection";False:C215)
		OBJECT SET VISIBLE:C603(*;"UnselectRowsCollection";False:C215)
		
		manageTexts 
		
End case 