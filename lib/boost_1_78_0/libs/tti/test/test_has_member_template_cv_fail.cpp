
//  (C) Copyright Edward Diener 2019
//  Use, modification and distribution are subject to the Boost Software License,
//  Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
//  http://www.boost.org/LICENSE_1_0.txt).

#include "test_has_mem_fun_template.hpp"
#include <boost/mpl/assert.hpp>

int main()
  {
  
  // Member function template has wrong const/volatile type
  
  BOOST_MPL_ASSERT((BOOST_TTI_HAS_MEMBER_FUNCTION_TEMPLATE_GEN(WFunctionTmp)<void (AType::*)(int **, long &, bool) volatile>));
  
  return 0;

  }
