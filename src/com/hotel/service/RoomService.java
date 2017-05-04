package com.hotel.service;

import java.util.List;

import com.hotel.entity.Room;

public interface RoomService {

	List<Room> selectRoomByAll();

	List<Room> selectRoomByType(String type);

	void updateRoom(Room room);

	Room seleRoomById(int room_id);

}
