import request from 'superagent'

const defaultHeader = {
    Accept: 'application/json',
    token: JSON.parse(localStorage.getItem('token' || ''))
};

const requestList = [];
const request401List = [];

function checkResponse(err, res) {
    if (res.body && res.body.success) {
        return true;
    } else if (res.body && res.body.message) {
        return false;
    }

    !res.body ? res.body = {} : null;
    if (err && 404 === err.status) {
        res.body.message = '404, 要访问的地址找不到了, 操作失败';
    } else if (err && 403 === err.status) {
        res.body.message = '403, 服务器拒绝本次访问, 操作失败';
    } else if (err && 400 === err.status) {
        res.body.message = '400, 本次请求无效, 操作失败';
    } else if (err && 401 === err.status) {
        res.body.message = '401, 未取得访问授权(未登录), 操作失败';
        request401List.push(res.req);
    }
    return false;
}

function pushReq(req, onSuccess, onFailure) {
    req.onSuccess = onSuccess;
    req.onFailure = onFailure;
    requestList.push(req);
    send();
}

let sending = false;
function send() {
    if (!sending && 0 < requestList.length) {
        sending = true;
        let req = requestList.splice(0, 1)[0];
        req
            .set(defaultHeader)
            .end((err, res) => {
                if (res.header.token) {
                    defaultHeader.token = res.header.token;
                    localStorage.setItem('token', JSON.stringify(res.header.token));
                }
                checkResponse(err, res) ? req.onSuccess(res) : req.onFailure(err, res);
                sending = false;
                send();
            });
    }
}

export function request401Resend() {
    console.log('添加到请求列表的待请求个数: ' + request401List.length, '原请求个数: ' + requestList.length);
    requestList.push(...request401List);
    request401List.splice(0, request401List.length);
    console.log('请求总个数: ' + requestList.length);
    send();
}

export function clearRequest401List() {
    request401List.splice(0, request401List.length);
}

export function getRequest401ListLength() {
    return request401List.length;
}

export function get(url, param, onSuccess, onFailure) {
    query(url, param, onSuccess, onFailure);
}

export function query(url, param, onSuccess, onFailure) {
    const req = request
        .get(url)
        .query(param);
    pushReq(req, onSuccess, onFailure);
}

export function del(url, param, onSuccess, onFailure) {
    const req = request
        .del(url)
        .send(param);
    pushReq(req, onSuccess, onFailure);
}

export function update(url, param, onSuccess, onFailure) {
    const req = request
        .put(url)
        .send(param);
    pushReq(req, onSuccess, onFailure);
}

export function create(url, param, onSuccess, onFailure) {
    post(url, param, onSuccess, onFailure);
}

export function post(url, param, onSuccess, onFailure) {
    const req = request
        .post(url)
        .send(param);
    pushReq(req, onSuccess, onFailure);
}

export function upload(url, file, onSuccess, onFailure) {
    const req = request
        .post(url)
        .attach('file', file, file.name);
    pushReq(req, onSuccess, onFailure);
}

export function download(url, param, onSuccess, onFailure) {
    const req = request
        .post('/temp.json');
    pushReq(req, onSuccess, onFailure);
}
