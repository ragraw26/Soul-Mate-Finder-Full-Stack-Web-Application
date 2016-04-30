package com.neu.mymatchFinder.pojo;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "userstable")
@Inheritance(strategy=InheritanceType.JOINED)
public class Userstable{

	private Integer userId;
	private String userfullName;
	private String userName;
	private String userPassword;
	private int dobmonth;
	private int dobday;
	private int dobyear;
	private int age;
	private Date lastLoginDate;
	private String email;
	private String gender;
	private String seekingGender;
	private String country;
	private String state;
	private String city;
	private String postalCode;
	private String aboutMe1;
	private int height;
	private int weight;
	private String studiesEmphasis;
	private String relocateFlag;
	private String headline;
	private String occupation;
	private String occupationDescription;
	private String grewUpIn;
	private String zodiacSign;
	private String languages;
	private String relationshipType;
	private String maritalStatus;
	private String hairColor;
	private String incomeLevel;
	private String educationLevel;
	private String bodyType;
	private String appearanceImportance;
	private String religion;
	private String eyeColor;
	private String ethnicity;
	private String politicalOrientation;
	private String intelligenceImportance;
	private String smokingHabits;
	private String activityLevel;
	private String custody;
	private String drinkingHabits;
	private String moreChildrenFlag;
	private String aboutMe2;
	private String personalityTrait;
	private String leisureActivity;
	private String perfectMatchEssay;
	private String cuisine;
	private String music;
	private String reading;
	private String perfectFirstDateEssay;
	private String entertainmentLocation;
	private String physicalActivity;
	private String idealRelationshipEssay;
	private String learnFromThePastEssay;
    private String fileLocation;
	
	
	public Userstable() {
	}

	public Userstable(String userfullName,String userName,String userPassword, int dobmonth, int dobday, int dobyear, int age,
			Date lastLoginDate, String email, String gender, String seekingGender, String country, String state,
			String city, String postalCode, String aboutMe1, String fileLocation, int height, int weight,
			String studiesEmphasis, String relocateFlag, String headline, String occupation,
			String occupationDescription, String grewUpIn, String zodiacSign, String languages, String relationshipType,
			String maritalStatus, String hairColor, String incomeLevel, String educationLevel, String bodyType,
			String appearanceImportance, String religion, String eyeColor, String ethnicity,
			String politicalOrientation, String intelligenceImportance, String smokingHabits, String activityLevel,
			String custody, String drinkingHabits, String moreChildrenFlag, String aboutMe2, String personalityTrait,
			String leisureActivity, String perfectMatchEssay, String cuisine, String music, String reading,
			String perfectFirstDateEssay, String entertainmentLocation, String physicalActivity,
			String idealRelationshipEssay, String learnFromThePastEssay) {
		
		this.userfullName = userfullName;
		this.userName = userName;
		this.userPassword = userPassword;
		this.dobmonth = dobmonth;
		this.dobday = dobday;
		this.dobyear = dobyear;
		this.age = age;
		this.lastLoginDate = lastLoginDate;
		this.email = email;
		this.gender = gender;
		this.seekingGender = seekingGender;
		this.country = country;
		this.state = state;
		this.city = city;
		this.postalCode = postalCode;
		this.aboutMe1 = aboutMe1;
		this.height = height;
		this.weight = weight;
		this.studiesEmphasis = studiesEmphasis;
		this.relocateFlag = relocateFlag;
		this.headline = headline;
		this.occupation = occupation;
		this.occupationDescription = occupationDescription;
		this.grewUpIn = grewUpIn;
		this.zodiacSign = zodiacSign;
		this.languages = languages;
		this.relationshipType = relationshipType;
		this.maritalStatus = maritalStatus;
		this.hairColor = hairColor;
		this.incomeLevel = incomeLevel;
		this.educationLevel = educationLevel;
		this.bodyType = bodyType;
		this.appearanceImportance = appearanceImportance;
		this.religion = religion;
		this.eyeColor = eyeColor;
		this.ethnicity = ethnicity;
		this.politicalOrientation = politicalOrientation;
		this.intelligenceImportance = intelligenceImportance;
		this.smokingHabits = smokingHabits;
		this.activityLevel = activityLevel;
		this.custody = custody;
		this.drinkingHabits = drinkingHabits;
		this.moreChildrenFlag = moreChildrenFlag;
		this.aboutMe2 = aboutMe2;
		this.personalityTrait = personalityTrait;
		this.leisureActivity = leisureActivity;
		this.perfectMatchEssay = perfectMatchEssay;
		this.cuisine = cuisine;
		this.music = music;
		this.reading = reading;
		this.perfectFirstDateEssay = perfectFirstDateEssay;
		this.entertainmentLocation = entertainmentLocation;
		this.physicalActivity = physicalActivity;
		this.idealRelationshipEssay = idealRelationshipEssay;
		this.learnFromThePastEssay = learnFromThePastEssay;
		this.fileLocation = fileLocation;
		//this.userAccount = userAccount;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "UserID", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}
	

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
	@Column(name = "UserfullName", nullable = false)
	public String getUserfullName() {
		return userfullName;
	}

	public void setUserfullName(String userfullName) {
		this.userfullName = userfullName;
	}

	@Column(name = "UserName", nullable = false, length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "UserPassword", nullable = false, length = 20)
	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "DOBmonth", nullable = false)
	public int getDobmonth() {
		return this.dobmonth;
	}

	public void setDobmonth(int dobmonth) {
		this.dobmonth = dobmonth;
	}

	@Column(name = "DOBday", nullable = false)
	public int getDobday() {
		return this.dobday;
	}

	public void setDobday(int dobday) {
		this.dobday = dobday;
	}

	@Column(name = "DOByear", nullable = false)
	public int getDobyear() {
		return this.dobyear;
	}

	public void setDobyear(int dobyear) {
		this.dobyear = dobyear;
	}

	@Column(name = "age", nullable = false)
	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "lastLoginDate")
	public Date getLastLoginDate() {
		
		return this.lastLoginDate;
	}
	
	public void setLastLoginDate(Date date) {
		this.lastLoginDate = date;
	}

	@Column(name = "Email", nullable = false, length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Gender", nullable = false, length = 10)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "SeekingGender", nullable = false, length = 10)
	public String getSeekingGender() {
		return this.seekingGender;
	}

	public void setSeekingGender(String seekingGender) {
		this.seekingGender = seekingGender;
	}

	@Column(name = "Country", nullable = false, length = 50)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "State", nullable = false, length = 50)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "City", nullable = false, length = 50)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "PostalCode", nullable = false, length = 10)
	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Column(name = "AboutMe1", nullable = false, length = 65535)
	public String getAboutMe1() {
		return this.aboutMe1;
	}

	public void setAboutMe1(String aboutMe1) {
		this.aboutMe1 = aboutMe1;
	}

	@Column(name = "Height", nullable = false)
	public int getHeight() {
		return this.height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	@Column(name = "Weight", nullable = false)
	public int getWeight() {
		return this.weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	@Column(name = "StudiesEmphasis", nullable = false)
	public String getStudiesEmphasis() {
		return this.studiesEmphasis;
	}

	public void setStudiesEmphasis(String studiesEmphasis) {
		this.studiesEmphasis = studiesEmphasis;
	}

	@Column(name = "RelocateFlag", nullable = false, length = 20)
	public String getRelocateFlag() {
		return this.relocateFlag;
	}

	public void setRelocateFlag(String relocateFlag) {
		this.relocateFlag = relocateFlag;
	}

	@Column(name = "Headline", nullable = false, length = 65535)
	public String getHeadline() {
		return this.headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	@Column(name = "Occupation", nullable = false)
	public String getOccupation() {
		return this.occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	@Column(name = "OccupationDescription", nullable = false)
	public String getOccupationDescription() {
		return this.occupationDescription;
	}

	public void setOccupationDescription(String occupationDescription) {
		this.occupationDescription = occupationDescription;
	}

	@Column(name = "GrewUpIn", nullable = false, length = 100)
	public String getGrewUpIn() {
		return this.grewUpIn;
	}

	public void setGrewUpIn(String grewUpIn) {
		this.grewUpIn = grewUpIn;
	}

	@Column(name = "ZodiacSign", nullable = false, length = 20)
	public String getZodiacSign() {
		return this.zodiacSign;
	}

	public void setZodiacSign(String zodiacSign) {
		this.zodiacSign = zodiacSign;
	}

	@Column(name = "Languages", nullable = false)
	public String getLanguages() {
		return this.languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	@Column(name = "RelationshipType", nullable = false)
	public String getRelationshipType() {
		return this.relationshipType;
	}

	public void setRelationshipType(String relationshipType) {
		this.relationshipType = relationshipType;
	}

	@Column(name = "MaritalStatus", nullable = false, length = 100)
	public String getMaritalStatus() {
		return this.maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	@Column(name = "HairColor", nullable = false, length = 40)
	public String getHairColor() {
		return this.hairColor;
	}

	public void setHairColor(String hairColor) {
		this.hairColor = hairColor;
	}

	@Column(name = "IncomeLevel", nullable = false, length = 100)
	public String getIncomeLevel() {
		return this.incomeLevel;
	}

	public void setIncomeLevel(String incomeLevel) {
		this.incomeLevel = incomeLevel;
	}

	@Column(name = "EducationLevel", nullable = false, length = 200)
	public String getEducationLevel() {
		return this.educationLevel;
	}

	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}

	@Column(name = "BodyType", nullable = false, length = 200)
	public String getBodyType() {
		return this.bodyType;
	}

	public void setBodyType(String bodyType) {
		this.bodyType = bodyType;
	}

	@Column(name = "AppearanceImportance", nullable = false, length = 100)
	public String getAppearanceImportance() {
		return this.appearanceImportance;
	}

	public void setAppearanceImportance(String appearanceImportance) {
		this.appearanceImportance = appearanceImportance;
	}

	@Column(name = "Religion", nullable = false, length = 100)
	public String getReligion() {
		return this.religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	@Column(name = "EyeColor", nullable = false, length = 50)
	public String getEyeColor() {
		return this.eyeColor;
	}

	public void setEyeColor(String eyeColor) {
		this.eyeColor = eyeColor;
	}

	@Column(name = "Ethnicity", nullable = false, length = 100)
	public String getEthnicity() {
		return this.ethnicity;
	}

	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}

	@Column(name = "PoliticalOrientation", nullable = false, length = 100)
	public String getPoliticalOrientation() {
		return this.politicalOrientation;
	}

	public void setPoliticalOrientation(String politicalOrientation) {
		this.politicalOrientation = politicalOrientation;
	}

	@Column(name = "IntelligenceImportance", nullable = false, length = 50)
	public String getIntelligenceImportance() {
		return this.intelligenceImportance;
	}

	public void setIntelligenceImportance(String intelligenceImportance) {
		this.intelligenceImportance = intelligenceImportance;
	}

	@Column(name = "SmokingHabits", nullable = false, length = 50)
	public String getSmokingHabits() {
		return this.smokingHabits;
	}

	public void setSmokingHabits(String smokingHabits) {
		this.smokingHabits = smokingHabits;
	}

	@Column(name = "ActivityLevel", nullable = false, length = 100)
	public String getActivityLevel() {
		return this.activityLevel;
	}

	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}

	@Column(name = "Custody", nullable = false, length = 100)
	public String getCustody() {
		return this.custody;
	}

	public void setCustody(String custody) {
		this.custody = custody;
	}

	@Column(name = "DrinkingHabits", nullable = false, length = 50)
	public String getDrinkingHabits() {
		return this.drinkingHabits;
	}

	public void setDrinkingHabits(String drinkingHabits) {
		this.drinkingHabits = drinkingHabits;
	}

	@Column(name = "MoreChildrenFlag", nullable = false, length = 50)
	public String getMoreChildrenFlag() {
		return this.moreChildrenFlag;
	}

	public void setMoreChildrenFlag(String moreChildrenFlag) {
		this.moreChildrenFlag = moreChildrenFlag;
	}

	@Column(name = "AboutMe2", nullable = false, length = 65535)
	public String getAboutMe2() {
		return this.aboutMe2;
	}

	public void setAboutMe2(String aboutMe2) {
		this.aboutMe2 = aboutMe2;
	}

	@Column(name = "PersonalityTrait", nullable = false)
	public String getPersonalityTrait() {
		return this.personalityTrait;
	}

	public void setPersonalityTrait(String personalityTrait) {
		this.personalityTrait = personalityTrait;
	}

	@Column(name = "LeisureActivity", nullable = false)
	public String getLeisureActivity() {
		return this.leisureActivity;
	}

	public void setLeisureActivity(String leisureActivity) {
		this.leisureActivity = leisureActivity;
	}

	@Column(name = "PerfectMatchEssay", nullable = false, length = 65535)
	public String getPerfectMatchEssay() {
		return this.perfectMatchEssay;
	}

	public void setPerfectMatchEssay(String perfectMatchEssay) {
		this.perfectMatchEssay = perfectMatchEssay;
	}

	@Column(name = "Cuisine", nullable = false)
	public String getCuisine() {
		return this.cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	@Column(name = "Music", nullable = false)
	public String getMusic() {
		return this.music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	@Column(name = "Reading", nullable = false)
	public String getReading() {
		return this.reading;
	}

	public void setReading(String reading) {
		this.reading = reading;
	}

	@Column(name = "PerfectFirstDateEssay", nullable = false, length = 65535)
	public String getPerfectFirstDateEssay() {
		return this.perfectFirstDateEssay;
	}

	public void setPerfectFirstDateEssay(String perfectFirstDateEssay) {
		this.perfectFirstDateEssay = perfectFirstDateEssay;
	}

	@Column(name = "EntertainmentLocation", nullable = false)
	public String getEntertainmentLocation() {
		return this.entertainmentLocation;
	}

	public void setEntertainmentLocation(String entertainmentLocation) {
		this.entertainmentLocation = entertainmentLocation;
	}

	@Column(name = "PhysicalActivity", nullable = false)
	public String getPhysicalActivity() {
		return this.physicalActivity;
	}

	public void setPhysicalActivity(String physicalActivity) {
		this.physicalActivity = physicalActivity;
	}

	@Column(name = "IdealRelationshipEssay", nullable = false, length = 65535)
	public String getIdealRelationshipEssay() {
		return this.idealRelationshipEssay;
	}

	public void setIdealRelationshipEssay(String idealRelationshipEssay) {
		this.idealRelationshipEssay = idealRelationshipEssay;
	}

	@Column(name = "LearnFromThePastEssay", nullable = false, length = 65535)
	public String getLearnFromThePastEssay() {
		return this.learnFromThePastEssay;
	}

	public void setLearnFromThePastEssay(String learnFromThePastEssay) {
		this.learnFromThePastEssay = learnFromThePastEssay;
	}
	
	  @Column(name="FileLocation", nullable=false, length=100)
	    public String getFileLocation() {
	        return this.fileLocation;
	    }
	    
	    public void setFileLocation(String fileLocation) {
	        this.fileLocation = fileLocation;
	    }

			
	
}
