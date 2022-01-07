package com.jebi.dto;

public class KakaoDTO {
    private String kid, knickname, kemail;

    public KakaoDTO(String kid, String knickname, String kemail) {
        this.kid = kid;
        this.knickname = knickname;
        this.kemail = kemail;
    }

    public String getKid() {
        return this.kid;
    }

    public void setKid(String kid) {
        this.kid = kid;
    }

    public String getKnickname() {
        return this.knickname;
    }

    public void setKnickname(String knickname) {
        this.knickname = knickname;
    }

    public String getKemail() {
        return this.kemail;
    }

    public void setKemail(String kemail) {
        this.kemail = kemail;
    }
}
