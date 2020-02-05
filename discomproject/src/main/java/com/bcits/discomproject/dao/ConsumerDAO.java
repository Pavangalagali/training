package com.bcits.discomproject.dao;

import java.util.List;

import com.bcits.discomproject.beans.ConsumerMaster;
import com.bcits.discomproject.beans.CurrentBill;
import com.bcits.discomproject.beans.MonthlyConsumption;
import com.bcits.discomproject.beans.SupportRequest;

public interface ConsumerDAO {

	public boolean signUpConsumer(ConsumerMaster consumerMaster);

	public ConsumerMaster authenticate(String rrNumber, String password);

	public List<MonthlyConsumption> consumptions(String rrNumber);
	
	public CurrentBill currentBill(String rrNumber);
	
	public boolean billPayment(String rrNumber);
	
	public boolean supportRequest(String rrNumber, String msg);
	
	public ConsumerMaster find(String rrNumber);
	
	public List<SupportRequest> getSupportRequest(String rrNumber);
}
