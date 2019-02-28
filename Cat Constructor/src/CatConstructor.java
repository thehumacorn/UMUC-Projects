
public class CatConstructor {
		private String nameCat;
		private String colorCat;
		private int ageCat;
		
public CatConstructor(String nameCat,String colorCat,int ageCat){
	this.nameCat = nameCat;
	this.colorCat = colorCat;
	this.ageCat = ageCat;
    }
    public String toString() 
	 {
	 return "(Cat's Name = "+this.nameCat+" "+ "Cat's Color = "+this.colorCat+" "+"Age of Cat = " +this.ageCat+")";
    }
}