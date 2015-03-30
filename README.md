StockChartView
===============

An iOS stock chart view, K-Line, volume graph.

![Screenshots](https://github.com/chenxiaoyu3/BBStockChartView/blob/master/BBStockChartViewDemo/Screenshots/1.png)

BStockchartView is used in project [BBAltcoin](http://bbaltcoin.com/) in [AppStore](https://itunes.apple.com/tt/app/bb-kan-pan/id962337229?mt=8) and Android. The iOS source is [here](https://github.com/chenxiaoyu3/BBAltcoin-iOS).
----------------
See the demo xcode project for details
- - - 

```Objective-C
//init with any size, autolayout
_chartView = [[BBChartView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
[self.view addSubview:_chartView];
// a sample data file stored in data.json
[self loadData];

// if you want to clear the data
//[_chartView reset];

//ChartView add area, area add series
Area* areaup = [[Area alloc] init];
//set delegate for axis's data provider
areaup.bottomAxis.labelProvider = self;
Area* areadown = [[Area alloc] init];
areadown.bottomAxis.labelProvider = self;
BarSeries* bar = [[BarSeries alloc] init];
StockSeries* stock = [[StockSeries alloc] init];
[areaup addSeries:stock];
[areadown addSeries:bar];

for (NSArray* arr in _chartData) {
	[bar addPoint:Float(arr[1])];
	[stock addPointOpen:Float(arr[2]) close:Float(arr[5]) low:Float(arr[4]) high:Float(arr[3])];
}
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
B
