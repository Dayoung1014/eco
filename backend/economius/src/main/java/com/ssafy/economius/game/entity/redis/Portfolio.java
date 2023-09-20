package com.ssafy.economius.game.entity.redis;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Portfolio {

    private Long player;
    private int money;
    private int totalMoney;
    private PortfolioGold gold;
    private PortfolioSavings savings;
    private PortfolioBuildings buildings;
    private PortfolioStocks stocks;
    private PortfolioInsurances insurances;

    public void updateTotalMoney() {
        this.totalMoney =
            gold.getTotalPrice() +
                savings.getTotalPrice() +
                buildings.getTotalPrice() +
                stocks.getTotalPrice() +
                money;
    }

    public void buyBuilding(int buildingId, Building building) {
        this.totalMoney -= building.getPrice();
        this.buildings.buyBuilding(buildingId, building);
    }
}
