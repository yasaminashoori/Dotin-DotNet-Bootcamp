﻿$(document).ready(function() {
    $("#AddFavorite").click(function () {

        $.get(getFavoritesPath, function (data) {
            $("#FavoritesPlaceHolder").append(data);
            $("#Favorites:last-child").focus();
        });
    });
});

$(document).ready(function () {
    $("#AddPhone").click(function () {

        $.get(getPhonesPath, function (data) {
            $("#PhonesPlaceHolder").append(data);
            $("#Phones:last-child").focus();
        });
    });
});