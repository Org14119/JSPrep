// JavaScript Document
var aDiv=document.getElementsByTagName("div");
var aTd=document.getElementsByTagName("td");
var aBtn=document.getElementsByTagName("button");
var aDiv_myDiv = new Array();
var aTd_myTd = new Array();
var aBtn_myBtn = new Array();

for(i=0,j=0;i<aDiv.length;i++){
	if(aDiv[i].className=="white_content"){
		aDiv_myDiv[j]=aDiv[i];
		j++;
	}
};
for(i=0,j=0;i<aTd.length;i++){
	if(aTd[i].className=="question_td"){
		aTd_myTd[j]=aTd[i];
		j++;
	}
};
for(i=0,j=0;i<aBtn.length;i++){
	if(aBtn[i].className=="question_btn"){
		aBtn_myBtn[j]=aBtn[i];
		j++;
	}
};
aTd_myTd[0].onclick =function(){
		aDiv_myDiv[0].style.display="block";
	}
for(i=0;i<aTd_myTd.length;i++){
	 aTd_myTd[i].index=i;
	aTd_myTd[i].onclick =function(){
		aDiv_myDiv[this.index].style.display="block";
		aDiv_myDiv[this.index].style.top+=(i*30)px;
	}
}
for(i=0;i<aBtn_myBtn.length;i++){
	aBtn_myBtn[i].index=i;
	aBtn_myBtn[i].onclick =function(){
			aDiv_myDiv[this.index].style.display="none";
	}
}