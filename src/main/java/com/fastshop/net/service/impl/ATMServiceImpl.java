package com.fastshop.net.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fastshop.net.model.ATM;
import com.fastshop.net.repository.ATMDAO;
import com.fastshop.net.service.ATMService;

@Service
public class ATMServiceImpl implements ATMService{
    @Autowired
    ATMDAO atmdao;

    @Override
    public ATM findById(Integer id) {
        return atmdao.findById(id).get();
    }

    @Override
    public ATM findByUsername(String username) {
        return atmdao.findByUsername(username);
    }

    @Override
    public ATM findByNumber(String number) {
        return atmdao.findByNumber(number);
    }
}
