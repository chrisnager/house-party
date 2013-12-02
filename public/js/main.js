$( function() {

    // Select friends in facebook friend list
    $( '.friend-list__item' ).on( 'click', 'a', function() {
        $( this ).parent().toggleClass( 'is-selected' );
    });

});
