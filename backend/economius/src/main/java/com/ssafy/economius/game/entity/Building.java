package com.ssafy.economius.game.entity;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

@RedisHash
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class Building {

    @Id
    private String buildingCode;
    private String buildingName;
    private String ownerId;

    private int price;
    private List<Integer> priceHistory;
    private int rate;
    private List<Integer> rateHistory;
}
