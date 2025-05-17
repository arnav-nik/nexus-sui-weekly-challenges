/*
/// Module: blacksmith_package
module blacksmith_package::blacksmith_package;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module blacksmith_package::blacksmith_module;

public struct Sword has key, store {
    id: UID, 
    magic: u64,
    strength: u64,
}

public struct Forge has key {
    id: UID,
    swords_created: u64,
}

fun init(ctx:&mut TxContext) {
    let admin = Forge {
        id: object::new(ctx),
        swords_created: 0,
    };

    // Transfering forge object to module/package publisher
    transfer::transfer(admin, ctx.sender());
} 

public fun magic(self: &Sword): u64 {
    self.magic
}

public fun strength(self: &Sword): u64 {
    self.strength
}

public fun swords_created(self: &Forge): u64 {
    self.swords_created
}

public fun create_sword(forge: &mut Forge, magic: u64, strength: u64, ctx: &mut TxContext): Sword {
    forge.swords_created = forge.swords_created + 1;

    Sword{
        id: object::new(ctx),
        magic: magic,
        strength: strength
    }
}
