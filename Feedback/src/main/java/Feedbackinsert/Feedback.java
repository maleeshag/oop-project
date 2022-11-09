package Feedbackinsert;

public class Feedback {
	private int feedbackid;
	private String coustomer;
	private String Feedback;
	private String feedbackrate;
	
	
	public Feedback(int feedbackid, String coustomer, String feedback, String feedbackrate) {
		super();
		this.feedbackid = feedbackid;
		this.coustomer = coustomer;
		this.Feedback = feedback;
		this.feedbackrate = feedbackrate;
		
         System.out.println("feed back ekth wda "+ feedbackid);
	}


	public int getFeedbackid() {
		return feedbackid;
	}

	public String getCoustomer() {
		return coustomer;
	}
   
	public String getFeedback() {
		return Feedback;
	}

	public String getFeedbackrate() {
		return feedbackrate;
	}

}
