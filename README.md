COCA-COLA DISPENSER  
&emsp;You have been tasked with developing an automated Coca-Cola Dispenser that provides convenience and efficiency to users. Each can of Coca-Cola costs 1 RON, and the only acceptable coin denominations for insertion are 0.05, 0.10, and 0.50 RON.  
&emsp;To ensure a seamless experience, the following requirements must be met:  
&emsp;•	Availability of Cans: The dispenser should prohibit money insertion if no cans are available. This ensures that users are not misled into inserting money without the possibility of receiving a can in return.  
&emsp;•	Total Amount Verification: The system should keep track of the total amount of money inserted. This feature allows for accurate monitoring of the funds collected and enables further processing.  
&emsp;•	Inadequate Funds: If the total amount inserted is insufficient to purchase a can, the system should promptly return the money to the user. This prevents any inconvenience caused by lost funds or unnecessary transactions.  
&emsp;•	Coin Validation and Total Amount Notification: The dispenser should provide clear signals to indicate the acceptance of coins and the ongoing accumulation of the total amount. These signals help users to understand the status of their transaction and instill confidence in the system.  
&emsp;By incorporating these requirements into the design and implementation of the automated Coca-Cola Dispenser, users will be able to enjoy a smooth and reliable experience while purchasing their desired cans of Coca-Cola.  
  
DESIGN  
Black Box  
	  
 ![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/82fbab9e-939e-4a72-aa1d-828223d5c68f)  
  
  
Those are the pins use:  
•	F0 – input for 0.05 RON coin  
•	F1 – input for 0.10 RON coin  
•	F2 – input for 0.50 RON coin  
•	F3 – signal for coin refusal  
•	F4 – signal for coin approval  
•	RESET – signal for emptying the money in the dispenser  
•	AT – output representing the total amount you have inserted  
•	RM – signal indicating the reset of the machine  
•	FS – output indicating that the vending machine does not have any can left  
•	AM – signal indicating the approval of a coin  
  
Breakdown of the Execution Unit  
	  
  Here are the components of the Execution Unit:   
1.	The coin verification component:  
   
 ![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/e793568d-2a03-4db2-8454-056145c22a12)  
   
&emsp;The primary function of this component is to facilitate the approval process for coin insertion in the vending machine. However, the approval is contingent upon the state of the "accept" input, which must have a value of '1' to validate the coin insertion.  
&emsp;In order to ensure a seamless user experience, the component incorporates an additional input labeled "refuse." When the "refuse" input is true, it indicates that the coin insertion should be disregarded, and this signal is promptly communicated to the user. It is important to note that the "accept" and "refuse" inputs must have opposite truth values, meaning that when one input is true, the other input must be false.  
&emsp;By implementing this mechanism, the component provides a clear and unambiguous indication to the user regarding the status of the coin insertion. If the "accept" input is true and the "refuse" input is false, the coin is approved and can be processed further. However, if the "refuse" input is true, the component ensures that the coin insertion is ignored, thus preventing any undesired transactions from taking place.  
&emsp;By adhering to these conditions and incorporating this component into the vending machine's design, it ensures that only approved coin insertions are considered, while providing clear feedback to the user regarding the acceptance or refusal of their coins.  
  
2.	The money counter component:   
   
![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/9ed47415-8379-4a5d-8e93-641d74f5fe51)  
  
&emsp;This pivotal component plays a crucial role in accurately monitoring the funds inserted into the dispenser. By leveraging the inputs "f0," "f1," and "f2," the stored amount increases based on their respective values. The "enable" input serves as a permission signal, allowing money to be added as long as cans are available for sale. Asynchronous in nature, the "reset" input promptly empties the stored amount when triggered. When the "sold" input indicates sufficient funds for a Coca-Cola can, the component deducts 1 RON from the total sum entered. Ultimately, the output provides a precise representation of the remaining money in the machine, ensuring transparency and efficient financial management.  
  
3.	The change component:  
   
![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/c35f3544-36b0-4f5d-ac88-63cd5b610320)  
  
&emsp;The change component plays a crucial role in managing the financial transactions within the vending machine. It operates based on the information received through the 8-bit input labeled "sum," which represents the current amount of money available in the machine.  
&emsp;When the component detects that there is an exact amount of 1 RON available in the storage of the dispenser, it triggers a pulse, symbolizing that a can of refreshing Coca-Cola is ready to be dispensed to the user. This signal is conveyed through the "cokeDispence" pin, providing a clear indication that the desired beverage is now accessible for purchase.  
&emsp;Simultaneously, the component calculates and outputs the precise change that the customer is entitled to receive. This change is communicated through the "change" pin, allowing for a seamless transaction experience. By accurately determining the difference between the amount paid and the cost of the can, the change component ensures that customers receive the correct amount of change for their purchase.  
&emsp;By incorporating this component into the vending machine's functionality, it enables efficient management of transactions and enhances the overall user experience. It guarantees the prompt dispensing of Coca-Cola cans when sufficient funds are available while simultaneously providing the necessary change to complete the transaction accurately.  
  
4.	Coin accept component:  
   
![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/f01039d8-07b2-4bd5-993c-6d2c92b1ad7e)  
  
&emsp;The role of this vital component is to effectively detect and signal the approval of coins inserted into the machine. This is achieved through the utilization of the "am" pin, which acts as an indicator.  
&emsp;The component operates on the basis of three inputs: "a," "b," and "c," each representing a specific type of coin that the machine can accept. Whenever one of these three inputs transitions to a true state, the "am" pin synchronously reflects the same true state. This functionality ensures that the system promptly acknowledges the successful acceptance of a coin.  
&emsp;However, there is a notable exception to this rule. When the "notAllowed" pin receives a true value, it overrides the behavior of the other three inputs. In this scenario, the "am" pin is prevented from transitioning to a true state, effectively disregarding the inputs from "a," "b," and "c." This mechanism ensures that any unauthorized or disallowed coins do not trigger the approval signal.  
&emsp;By incorporating this component into the machine's design, users can have confidence in the accurate detection and signaling of approved coins. The system ensures seamless operation, with proper recognition of accepted coins and the ability to identify and prevent the acceptance of any disallowed forms of currency.  
  
5.	The stock check component:  
  
![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/7e638856-930a-4afd-acda-b9c886bb1039)  
  
&emsp;This essential component serves the purpose of tracking the quantity of cans remaining in the machine, ensuring smooth operation and efficient sales management.  
&emsp;By default, the machine starts with a stocked inventory of 10 cans, ready for distribution.  
&emsp;With each detection of a rising edge of the clock signal, symbolizing a transaction or sale, this component intelligently deducts one can from the stock. This accurate tracking mechanism guarantees precise inventory management, reflecting real-time updates as cans are sold to users.  
&emsp;The output signal provided by this component is a valuable indicator of the availability of Coca-Cola cans for purchase. It remains true as long as there are cans in stock, signifying that customers can still enjoy the refreshing beverage. However, the signal will transition to false when the dispenser eventually runs out of cans, serving as a clear indication that the stock needs replenishment.  
&emsp;By incorporating this component into the machine's design, it ensures a seamless and reliable user experience, allowing for efficient tracking of stock levels and prompt awareness of the need for restocking.  
  
The detailed diagram of the project  
  
![image](https://github.com/doriandamian/vhdlVendingMachine/assets/134055215/d331b83e-b1bb-4ecb-883c-51e650e724a4)  
  
  
USER MANUAL  
  
&emsp;In order to ensure a seamless user experience, several key steps have been implemented for the coin-operated machine:  
&emsp;1.	Coin Acceptance and Rejection: Since it is not possible to automatically verify the coins inserted into the machine, the user is responsible for determining whether a coin is accepted or denied. This is accomplished through the use of two pins: "f3" (denied) and "f4" (approved). It is crucial to note that these two pins cannot have the same value, thereby avoiding any confusion.  
&emsp;2.	Coin Value Recognition: Once the user has selected whether a coin is approved or denied, the next step is to press the corresponding button that matches the value of the inserted coin. By doing so, the user can observe the output labeled "AT" to keep track of the total amount of money inserted into the machine. This feature ensures transparency and enables users to stay informed about the funds they have deposited.  
&emsp;3.	Money Withdrawal: When the user wishes to retrieve the remaining money from the dispenser, they can simply press the "Reset" button. At this point, the amount displayed through the "AT" output is considered the sum that will be returned to the user.  
&emsp;By incorporating these steps into the design of the coin-operated machine, users can easily navigate the process of coin acceptance, track their accumulated funds, and withdraw their money when desired.  
  
