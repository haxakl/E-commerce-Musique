<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:body>
        <div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#">Product name</a></h4>
                                            <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                                            <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                        </div>
                                    </div></td>
                                <td class="col-sm-1 col-md-1" style="text-align: center">
                                    <input type="email" class="form-control" id="exampleInputEmail1" value="3">
                                </td>
                                <td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
                                <td class="col-sm-1 col-md-1">
                                    <button type="button" class="btn btn-danger">
                                        <i class="fa fa-times"></i> Remove
                                    </button></td>
                            </tr>
                            <tr>
                                <td class="col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#">Product name</a></h4>
                                            <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                                            <span>Status: </span><span class="text-warning"><strong>Leaves warehouse in 2 - 3 weeks</strong></span>
                                        </div>
                                    </div></td>
                                <td class="col-md-1" style="text-align: center">
                                    <input type="email" class="form-control" id="exampleInputEmail1" value="2">
                                </td>
                                <td class="col-md-1 text-center"><strong>$4.99</strong></td>
                                <td class="col-md-1 text-center"><strong>$9.98</strong></td>
                                <td class="col-md-1">
                                    <button type="button" class="btn btn-danger">
                                        <i class="fa fa-times"></i> Remove
                                    </button></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Subtotal</h5></td>
                                <td class="text-right"><h5><strong>$24.59</strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Estimated shipping</h5></td>
                                <td class="text-right"><h5><strong>$6.94</strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h3>Total</h3></td>
                                <td class="text-right"><h3><strong>$31.53</strong></h3></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>
                                    <button type="button" class="btn btn-default">
                                        <i class="fa fa-shopping-cart"></i> Continue Shopping
                                    </button></td>
                                <td>
                                    <button type="button" class="btn btn-success">
                                        Checkout <i class="fa fa-check"></i>
                                    </button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>
</t:frontoffice>