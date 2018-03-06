pragma solidity ^0.4.0.;
contract Nutrition 
{
    struct Health
    {
        uint256 Customerid;
        uint256 Customersitemid;
        uint256 NumberofQuantity;
        uint256 CustomersTotalBillAmount;
         string Customername;
        uint256 ParticularProductQuantity;
        uint256 BoardingPurchaseCount;
        uint256 BoardingDay;
        uint256 TotalBoardingcharge;
        uint256 BoardedAttendence;
        uint256 BoarderId;
        uint256 Full_Payment;   
    }
    uint256 []CustomerCount;
    string  []Itemname;
    uint256 []priceper;
    uint256 []TotalQuantity;
    uint256 []Item_Array;
    uint256 CustomersTotal;
    uint256 Perdaycharge=2500;
    uint256 []Boardingcustomers;
    mapping(uint=>Health)key;
    mapping(uint=>Health)board_key;
    mapping(uint=>bool)Temperoary_Customer_status;
    mapping(uint=>bool)Admit_status;
    mapping(uint=>bool)Repeated_Customer_status;
    function Production(uint256 _itemid,string _itemname,uint256 _itemprice,uint256 _total)public
    {
            Item_Array.push(_itemid);
            Itemname.push(_itemname);   
            priceper.push(_itemprice);
            key[_itemid].ParticularProductQuantity=_total;
    }
    function Items()public constant returns(uint256[])
    {
        return Item_Array;
    }
    function  Food_Serve(uint256 _cid,uint256 _itemid,uint256 _total)public 
    {   
        uint256 i;
        if(Temperoary_Customer_status[_cid]==false)
            {
            Temperoary_Customer_status[_cid]=true;
            key[_cid].Customerid=_cid;
            CustomerCount.push(_cid);
            key[_cid].Customersitemid=_itemid;
            key[_cid].NumberofQuantity=_total;
            while(i<key[_cid].NumberofQuantity)
                {
                    key[_itemid].ParticularProductQuantity--;
                    i++;
                }
            key[_cid].CustomersTotalBillAmount+=priceper[_itemid]*key[_cid].NumberofQuantity;
            }
        else
            {
                key[_cid].Customerid=_cid;
                key[_cid].Customersitemid=_itemid;
                key[_cid].NumberofQuantity=_total;
                while(i<key[_cid].NumberofQuantity)
                    {
                    key[_itemid].ParticularProductQuantity--;
                    i++;
                    }
            key[_cid].CustomersTotalBillAmount+=priceper[_itemid]*key[_cid].NumberofQuantity;
            }
        
    }
    function Bill(uint256 _cid,uint256 _itemid)public constant returns(uint256,string,uint256,uint256)
    {
        return (key[_cid].Customerid,Itemname[_itemid],key[_cid].NumberofQuantity,key[_cid].CustomersTotalBillAmount);
    }
   function  View_Quantity(uint256 _itemid)public constant returns(string,uint256)
   {
       return (Itemname[_itemid],key[_itemid].ParticularProductQuantity);
   }
   function Beneficiary_Customers()public constant returns(uint256[])
   {
       return CustomerCount;
   }
   function Boarding(uint256 _cid,uint256 _itemid,uint256 _total)public 
   {
        require(Temperoary_Customer_status[_cid]==false);
        board_key[_cid].BoardedAttendence=_cid;
        require(Repeated_Customer_status[_cid]==false);
                if(Admit_status[_cid]==false)
                {
                Admit_status[_cid]==true;
                key[_cid].Customerid=_cid;
                Boardingcustomers.push(_cid);
                key[_cid].Customersitemid=_itemid;
                key[_cid].NumberofQuantity=_total;
                key[_cid].BoardingPurchaseCount++;
                     uint256 i;
                if(key[_cid].BoardingPurchaseCount%3==0)
                {
                    key[_cid].BoardingDay++;  
                }
                    while(i<key[_cid].NumberofQuantity)
                    {
                    key[_itemid].ParticularProductQuantity--;
                    i++;
                    }
                }
                else
                {
                    uint j;
                key[_cid].Customerid=_cid;
                key[_cid].Customersitemid=_itemid;
                key[_cid].NumberofQuantity=_total;
                key[_cid].BoardingPurchaseCount++;
                if(key[_cid].BoardingPurchaseCount%3==0)
                {
                    key[_cid].BoardingDay++;  
                }
                    while(j<key[_cid].NumberofQuantity)
                    {
                    key[_itemid].ParticularProductQuantity--;
                    i++;
                    }
            }
               
   }
   function Close(uint256 _cid,uint256 _itemid)public
   {
       Repeated_Customer_status[_cid]=true;
        if(key[_cid].BoardingPurchaseCount<3)
                    {
                        key[_cid].TotalBoardingcharge=1500;
                    }
                     else
                        {
                            key[_cid].TotalBoardingcharge=key[_cid].BoardingDay*Perdaycharge;
                        }
                        
                key[_cid].Full_Payment=key[_cid].TotalBoardingcharge+(key[_itemid].ParticularProductQuantity*key[_cid].NumberofQuantity);                
    }
   function Boarding_Charge(uint256 _cid,uint256 _itemid)public constant returns(uint256,uint256,string,uint256,uint256,uint256,uint256)
   {
       uint c=_cid;
       return (key[c].Customerid,key[c].Customersitemid,Itemname[_itemid],key[c].NumberofQuantity,key[c].BoardingPurchaseCount,key[c].BoardingDay,key[c].Full_Payment);
   }
   function Boarded_Customers()public constant returns(uint256 [])
   {
       return Boardingcustomers;
   }
   
}

