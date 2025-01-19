module two_s_complement(In,Out);
    input [3:0] In;
    output [3:0] Out;
    


    assign Out[0] =  In[0];
    assign Out[1] = (In[0] ^ In[1]);
    assign Out[2] = (In[0] | In[1]) ^ In[2];
    assign Out[3] = (In[3])^(In[0]|In[1]|In[2]);

endmodule  
