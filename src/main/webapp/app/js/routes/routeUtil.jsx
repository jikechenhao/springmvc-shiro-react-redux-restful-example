import { store } from 'js/redux';

export function validateRole(nextState, replace, role) {
    const { user } = store.getState();
    if (!user.logined || !user.userInfo.roleList) {
        replace({pathname: '/'});
        return;
    }

    let match = false;
    user.userInfo.roleList.forEach(roleItem => {
        match = roleItem.role === role;
    });

    if (!match) {
        replace({pathname: user.userInfo.roleList[0].url});
    }
}

export function getHomeUrl() {
    return store.getState().user.userInfo.roleList[0].url;
}

exports.history = {
    set(history) {
        this.history = history
    },

    get() {
        return this.history
    }
}