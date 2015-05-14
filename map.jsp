<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


  <head>
    <title>map.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    
    <script src="./js/map/echarts-all.js"></script>
    <script src="./js/jquery.min.js"></script>

  </head>
  
  <body>
     <div id="map" style="height:400px;"></div>
  </body>
  
      <script>
      
      var datas=null;
      $.getJSON('servlet/getMapTest',function(data){
      datas=data;
      
      console.log(datas);
      
            var myChart = echarts.init(document.getElementById('map'));
    option = {
    title : {
        text: '地区分类',
        subtext: '纯属虚构',
        x:'center'
    },
    tooltip : {
        trigger: 'item'
    },

    dataRange: {
        min: 0,
        max: 300,
        x: 'left',
        y: 'bottom',
        text:['高','低'],           // 文本，默认为数值文本
        calculable : true
    },
    toolbox: {
        show: true,
        orient : 'vertical',
        x: 'right',
        y: 'center',
        feature : {
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    roamController: {
        show: true,
        x: 'right',
        mapTypeControl: {
            'china': true
        }
    },
    series : [
        {
            name: '客户数量',
            type: 'map',
            mapType: 'china',
            roam: false,
            itemStyle:{
                normal:{label:{show:true}},
                emphasis:{label:{show:true}}
            },
            data:datas
        }


    ]
};
        myChart.setOption(option);
        
        });
    
    </script>
</html>
