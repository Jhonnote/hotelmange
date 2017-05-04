package com.hotel.mapper;

import java.util.List;

import com.hotel.entity.CheckIn;

public interface CheckInMapper {

	List<CheckIn> selectStaffAll(String type);

	int insertCheckIn(CheckIn checkin);

	CheckIn selectCheckInById(int id);

	int updateCheckIn(CheckIn checkin);

	List<CheckIn> selectAllCheckIn();

	List<CheckIn> selectAllCheckIns(String type);

	String selectAmount();

	String selectAmountType(String type);

}
