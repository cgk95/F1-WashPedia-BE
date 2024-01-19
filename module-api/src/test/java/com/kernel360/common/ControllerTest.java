package com.kernel360.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kernel360.commoncode.controller.CommonCodeController;
import com.kernel360.commoncode.service.CommonCodeService;
import com.kernel360.member.controller.MemberController;
import com.kernel360.member.service.MemberService;
import com.kernel360.product.controller.ProductController;
import com.kernel360.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest({
        CommonCodeController.class,
        MemberController.class,
        ProductController.class
})
@AutoConfigureRestDocs
public abstract class ControllerTest {

    @Autowired
    protected MockMvc mockMvc;

    @Autowired
    protected ObjectMapper objectMapper;

    @MockBean
    protected CommonCodeService commonCodeService;

    @MockBean
    protected MemberService memberService;

    @MockBean
    protected ProductService productService;
}
