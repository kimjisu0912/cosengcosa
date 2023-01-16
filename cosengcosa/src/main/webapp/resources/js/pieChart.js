/**
 * 파이 카트 관련 자바스크립트 
 */
 let chartConfig = {
  type: 'ring',
  title: {
    text: 'Drilldown Pie',
  },
  plot: {
    tooltip: {
      visible: false,
    },
    valueBox: {
      text: '%t',
      color: '#FFF',
      fontSize: '14px',
      fontWeight: 'none',
    },
    animation: {
      attributes: {},
      delay: 10,
      effect: 'ANIMATION_EXPAND_VERTICAL',
      method: 'ANIMATION_BACK_EASE_OUT',
      sequence: 'ANIMATION_BY_PLOT_AND_NODE',
      speed: 'ANIMATION_FAST',
    },
    cursor: 'hand',
    detach: false,
    shadow: true,
  },
  series: [
    {
      text: 'Visualization<br>Tools',
      values: [69],
      backgroundColor: '#F44336',
      'data-id': 'vt',
    },
    {
      text: 'Site<br>Performance',
      values: [69],
      backgroundColor: '#009688',
      'data-id': 'sp',
    },
    {
      text: 'Dev<br>Tools',
      values: [69],
      backgroundColor: '#00BCD4',
      'data-id': 'dt',
    },
    {
      text: 'Security<br>Tools',
      values: [69],
      backgroundColor: '#03A9F4',
      'data-id': 'st',
    },
    {
      text: 'Data<br>Management',
      values: [69],
      backgroundColor: '#673AB7',
      'data-id': 'dm',
    },
  ],
};

zingchart.render({
  id: 'myChart',
  data: chartConfig,
  height: '450px',
  width: '100%',
});

/**
 *  Secondary Charts
 */
let drilldownConfig = {
  type: 'bar',
  title: {
    text: 'Security Tools',
  },
  plot: {
    tooltip: {
      text: 'Quantity: %v',
      borderWidth: '0px',
      fontSize: '18px',
      shadow: true,
      shadowAlpha: 0.5,
      shadowBlur: 2,
      shadowColor: '#c4c4c4',
      shadowDistance: 3,
    },
    animation: {
      delay: 10,
      effect: 'ANIMATION_EXPAND_BOTTOM',
      method: 'ANIMATION_BACK_EASE_OUT',
      sequence: 'ANIMATION_BY_PLOT_AND_NODE',
      speed: '1200',
    },
  },
  plotarea: {
    margin: 'dynamic',
  },
  scaleX: {
    values: ['Firewall', 'Cache-control', 'Link-access', 'HTTP-Comp'],
    item: {
      color: '#555',
      fontSize: '12px',
      maxChars: 9,
    },
    label: {
      text: 'Type',
      color: '#555',
      fontSize: '16px',
      fontWeight: 'none',
    },
    lineColor: '#555',
    tick: {
      lineColor: '#555',
    },
  },
  scaleY: {
    guide: {
      visible: false,
    },
    item: {
      color: '#555',
      fontSize: '12px',
    },
    label: {
      text: 'Quantity',
      color: '#555',
      fontSize: '16px',
      fontWeight: 'none',
    },
    lineColor: '#555',
    tick: {
      lineColor: '#555',
    },
  },
  shapes: [
    {
      type: 'triangle',
      id: 'backwards',
      padding: '5px',
      angle: -90,
      backgroundColor: '#C4C4C4',
      cursor: 'hand',
      size: '10px',
      x: '20px',
      y: '20px',
    },
  ],
  series: [
    {
      values: [35, 15, 25, 10],
      styles: ['#1565C0', '#42A5F5', '#1E88E5', '#90CAF9'],
    },
  ],
};

/**
 * Manage drilldown config
 */
let drilldownDataStructure = {
  dm: {
    colors: ['#5E35B1', '#4527A0', '#7E57C2'],
    data: [10, 25, 35],
    scaleLabels: ['Relational', 'Non-relational', 'Cluster'],
    title: 'Data Management',
  },
  dt: {
    colors: ['#26C6DA', '#80DEEA', '#00838F', '#00ACC1'],
    data: [20, 8, 35, 20],
    scaleLabels: ['IDE', 'File-Management', 'Image-Generation', 'QA-testing'],
    title: 'Dev Tools',
  },
  sp: {
    colors: ['#26A69A', '#80CBC4', '#00695C', '#00897B'],
    data: [15, 5, 35, 20],
    scaleLabels: [
      'Speed-test',
      'Error-tracking',
      'Load-testing',
      'User-monitoring',
    ],
    title: 'Site Performance',
  },
  st: {
    colors: ['#1565C0', '#42A5F5', '#1E88E5', '#90CAF9'],
    data: [35, 15, 25, 10],
    scaleLabels: ['Firewall', 'Cache-control', 'Link-access', 'HTTP-Comp'],
    title: 'Security Tools',
  },
  vt: {
    colors: ['#EF5350', '#E53935', '#C62828'],
    data: [10, 25, 35],
    scaleLabels: ['Grid-component', 'Map-tool', 'Web-charting'],
    title: 'Visualization Tools',
  },
};

/*
 * Built in zingchart API event used to capture node click events.
 * Starting from this scope you will handle drilldown functionality.
 */
zingchart.node_click = function (p) {
  // You could use this data to help construct drilldown graphs check it out...
  if (drilldownDataStructure[p['data-id']]) {
    drilldownConfig['title']['text'] =
      drilldownDataStructure[p['data-id']]['title'];
    drilldownConfig['scaleX']['values'] =
      drilldownDataStructure[p['data-id']]['scaleLabels'];
    drilldownConfig['series'][0]['values'] =
      drilldownDataStructure[p['data-id']]['data'];
    drilldownConfig['series'][0]['styles'] =
      drilldownDataStructure[p['data-id']]['colors'];
    zingchart.exec('myChart', 'destroy');
    zingchart.render({
      id: 'drilldown1',
      data: drilldownConfig,
      height: '450px',
      width: '100%',
    });
  }
};

/*
 * Handle history buttons. You can assign
 * shapes id's and based on id you can go
 * 'forward' or 'backwards'. You could
 * also handle this with HTML and register
 * click events to those DOM elements.
 */
zingchart.shape_click = function (p) {
  let shapeId = p.shapeid;

  switch (shapeId) {
    case 'forwards':
    case 'backwards':
    case 'default':
      zingchart.exec('drilldown1', 'destroy');
      zingchart.render({
        id: 'myChart',
        data: chartConfig,
        height: '450px',
        width: '100%',
      });
      break;
  }
};