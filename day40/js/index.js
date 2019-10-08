/**
 * @api {get} /admin/uesr/login  用户登录
 * @apiName login
 * @apiGroup User
 *
 * @apiParam {int} id 用户账号ID
 * @apiParam {varchar} username 用户账号
 * @apiParam {varchar} password 用户密码
 * @apiParam {int} goodsid 商品ID
 * @apiParam {varchar} goodsname 商品名称
 * @apiParam {varchar} goodsimage 商品图片位置
 * @apiParam {tinyint} isSale 是否出售
 * @apiParam {tinyint} isRecom 是否包邮
 * @apiParam {int} goodsphone 商品电话
 * @apiParam {datetime} createTime 商品创建时间
 *
 * @apiSuccess {Number} err 状态码
 * @apiSuccess {String} msg  msg.
 * @apiSuccess {String} token  token
 */