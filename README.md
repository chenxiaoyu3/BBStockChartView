StockChartView
===============

A full customizable iOS stock chart view, K-Line, volume graph, with gesture supported.

![Screenshots](https://github.com/chenxiaoyu3/BBStockChartView/blob/master/BBStockChartViewDemo/Screenshots/v1.1.0.png)

BBStockchartView is used in project [BBAltcoin](http://bbaltcoin.com/) in [AppStore](https://itunes.apple.com/tt/app/bb-kan-pan/id962337229?mt=8) and [Android](http://bbaltcoin.com/). The iOS source is [here](https://github.com/chenxiaoyu3/BBAltcoin-iOS).

Installation
----------------
Using CocoaPods

```Pod
Pod "BBStockChartView"
```

Or add all files in folder "BBStockChartView" to your project.
Done!

Usage
----------------

See the demo Xcode project for details


```Objective-C
//init with any size, autolayout
_chartView = [[BBChartView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

//ChartView add area, area add series
Area* areaup = [[Area alloc] init];
Area* areadown = [[Area alloc] init];
BarSeries* bar = [[BarSeries alloc] init];
StockSeries* stock = [[StockSeries alloc] init];
[areaup addSeries:stock];
[areadown addSeries:bar];

// add data to bar and stock
// [stock addPoint:]
[self.chartView addArea:areaup];
[self.chartView addArea:areadown];
// two area's height ratio
[self.chartView setHeighRatio:0.3 forArea:areadown];

// set any color you like
[BBTheme theme].barBorderColor = [UIColor clearColor];
[BBTheme theme].xAxisFontSize = 11;

// begin to show the view animated
[self.chartView drawAnimated:YES];
```
----------

