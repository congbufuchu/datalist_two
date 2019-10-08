define({ "api": [
  {
    "type": "get",
    "url": "/admin/uesr/login",
    "title": "用户登录",
    "name": "login",
    "group": "User",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "id",
            "description": "<p>用户账号ID</p>"
          },
          {
            "group": "Parameter",
            "type": "varchar",
            "optional": false,
            "field": "username",
            "description": "<p>用户账号</p>"
          },
          {
            "group": "Parameter",
            "type": "varchar",
            "optional": false,
            "field": "password",
            "description": "<p>用户密码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "goodsid",
            "description": "<p>商品ID</p>"
          },
          {
            "group": "Parameter",
            "type": "varchar",
            "optional": false,
            "field": "goodsname",
            "description": "<p>商品名称</p>"
          },
          {
            "group": "Parameter",
            "type": "varchar",
            "optional": false,
            "field": "goodsimage",
            "description": "<p>商品图片位置</p>"
          },
          {
            "group": "Parameter",
            "type": "tinyint",
            "optional": false,
            "field": "isSale",
            "description": "<p>是否出售</p>"
          },
          {
            "group": "Parameter",
            "type": "tinyint",
            "optional": false,
            "field": "isRecom",
            "description": "<p>是否包邮</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "goodsphone",
            "description": "<p>商品电话</p>"
          },
          {
            "group": "Parameter",
            "type": "datetime",
            "optional": false,
            "field": "createTime",
            "description": "<p>商品创建时间</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "err",
            "description": "<p>状态码</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>msg.</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": "<p>token</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "js/index.js",
    "groupTitle": "User"
  }
] });
