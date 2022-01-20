package com.jebi.dto;

public class DepartureDTO {
    String cDay,gubun;
    String depart, arrival;
    public DepartureDTO(String cDay, String gubun, String depart, String arrival) {
        super();
        this.cDay = cDay;
        this.gubun = gubun;
        this.depart = depart;
        this.arrival = arrival;
    }
    public String getcDay() {
        return cDay;
    }
    public String getGubun() {
        return gubun;
    }
    public String getDepart() {
        return depart;
    }
    public String getArrival() {
        return arrival;
    }



}
