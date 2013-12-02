$( function() {

    // Select friends in facebook friend list
    $( '.friend-list__item' ).on( 'click', 'a', function( e ) {
        $( this ).parent().toggleClass( 'is-selected' );
        e.preventDefault;
    });

});
