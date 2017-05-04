package com.hotel.service;

import java.util.List;

import com.hotel.entity.CheckIn;

public interface CheckInService {

	List<CheckIn> selectStaffAll(String type);

	boolean insertCheckIn(CheckIn checkin,String type);

	CheckIn selectCheckInById(int id);

	void checkinroom(int id);

	void checkinbilling(int id);

	boolean updateCheckIn(CheckIn checkin);

	List<CheckIn> selectAllCheckIn(String type);

	String selectAmount(String type);

}
