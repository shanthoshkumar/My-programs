pragma solidity ^0.4.0;
contract Ipl
{
 struct cricket
 {
     uint256 Team_id;
     string Team_Name;
     uint256 Team_Points;
 }
mapping(uint=>cricket)key_1;
struct pl 
{
    uint[] pls;
    string Captain_Name;
}
mapping(uint=>pl)teams;
mapping(uint=>mapping(uint=>pl))key_2;
mapping(uint=>string)captain;
string [] Team;
uint256 player_id;
uint256 teamid=1;
function Ipl()public
    {
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 1-> Mumbai_Indians";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 2-> Sunrisers_Hyderabad";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 3-> Kolkata_Knight_riders";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 4-> Royal_challengers_Bangalore";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 5-> Delhi_Daredevils";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 6-> Rajasthan_Royals";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 7-> Kings_XI_punjab";
     Team.push(key_1[teamid].Team_Name);teamid++;
     key_1[teamid].Team_id=teamid;
     key_1[teamid].Team_Name="Team 8-> Chennai_super_kings";
     Team.push(key_1[teamid].Team_Name);
 }
 function View_Team(uint256 tid)public constant returns(uint256,string)
 {  
     require(tid<=Team.length);
     return (key_1[tid].Team_id,key_1[tid].Team_Name);
 }
 function Insert_Players(uint256 a)public 
 {
     for(uint256 i=1;i<=11;i++)
     {
         teams[a].pls.push((a*100)+i);
     }
 }
 function Display_Players(uint256 x)public constant returns(uint256[])
 {
     return  teams[x].pls;
 }
 function Fix_Captains(uint256 id,string cname)public
 {
     id=(id*100)+1;
    captain[id]=cname;
 }
 function Captain_Name(uint256 k)public constant returns(string)
 {
     k=(k*100)+1;
     return  captain[k];
 }
 /*function Team_details(uint256 x)public constant returns(uint256,string,uint256 [],string Captain_)
 {
     //require(x<=Team.length);
     uint256  k=x;
     k=(k*100)+1;
     return (key_1[x].Team_id,key_1[x].Team_Name,teams[x].pls,captain[k]);
 } */
 function Insert_Points(uint256 i,uint256 j)public
 {
    // require(i<=Team.length);
     require(j<=14);
     key_1[i].Team_Points=j;
 }
 function Points_table(uint256 i)public constant returns(uint256,string,uint256 [],string Captain_,uint256 Total_points_)
 {
     uint256 x=i;
     x=(x*100)+1;
     return (key_1[i].Team_id,key_1[i].Team_Name,teams[i].pls,captain[x],key_1[i].Team_Points);
 }
}
