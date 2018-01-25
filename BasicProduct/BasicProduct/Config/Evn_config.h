//
//  Evn_config.h
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#ifndef Evn_config_h
#define Evn_config_h

/**
 *  当前开发环境
 *  1   开发环境
 *  2   预发布环境
 *  3   真实环境
 *  4   联机测试环境
 */
///////////////////////////////////
/////更改环境请更改此处的环境变量值/////
#define _ENVIRONMENT 1
/////更改环境请更改此处的环境变量值/////
///////////////////////////////////


#if _ENVIRONMENT == 1

#define MainHttpUrl @""
#define NETWORK_TIMEOUT  30

#elif _ENVIRONMENT == 2

#define MainHttpUrl @""
#define NETWORK_TIMEOUT  30

#elif _ENVIRONMENT == 3

#define MainHttpUrl @""
#define NETWORK_TIMEOUT  30

#else

#define MainHttpUrl  @""
#define NETWORK_TIMEOUT  30

#endif

#endif /* Evn_config_h */
