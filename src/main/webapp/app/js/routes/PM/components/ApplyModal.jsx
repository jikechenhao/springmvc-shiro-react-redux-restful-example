import React from 'react';
import { connect } from 'react-redux';

import { queryBrand } from 'js/redux/actions/brand';
import { closeModal } from 'js/redux/actions/container';
import { putApply } from 'js/redux/actions/apply';

import IntInput from 'js/components/validation/IntInput';
import TextInput from 'js/components/validation/TextInput';
import Select from 'js/components/validation/Select';
import Modal from 'js/components/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class ApplyModal extends React.Component {
    componentDidMount() {
        const { dispatch, brandList, projectId } = this.props;
        if (0 >= brandList.length) {
            dispatch(queryBrand(projectId));
        }
    }

    render() {
        const { dispatch, material, target, brandList, title } = this.props;
        return (
            <Modal
                title = {title}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(putApply(material, target, event.target))}
                >
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        品牌:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <Select
                            name = 'brand'
                            value = {'item.brandId + \'-\' + item.brandName'}
                            text = {'item.brandName'}
                            optionList = {brandList}
                            emptyMsg = '请选择品牌'
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        申请数量:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <IntInput
                            name = 'applyAmount'
                            placeholder = '请输入要申请的数量'
                            notIntMsg = '请输入纯数字'
                            emptyMsg = '请输入要申请的数量'
                            outMaxRangeMsg = '这个数量是不是太大了..'
                            outMinRangeMsg = '请输入不小于0的数量'
                            max = {999999}
                            min = {0}
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        申请人:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'applyUser'
                            placeholder = '请输入申请人(可为空)'
                            outRangeMsg = '申请人最多为45个字符'
                            maxLength = '45'
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = 'col-sm-4 col-sm-offset-2 control-label'>备注:</label>

                    <div className = 'col-sm-10 col-sm-offset-1'>
                        <textarea rows = '3' className = 'form-control' name = 'comment'
                                  placeholder = '请输入备注信息(可为空)'></textarea>
                    </div>
                </div>
            </Modal>
        )
    }
}

export default connect(state => ({brandList: state.brandList}))(ApplyModal);