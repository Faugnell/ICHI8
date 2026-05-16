CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE character_class AS ENUM (
    'wanderer'
);

CREATE TYPE item_rarity AS ENUM (
    'common',
    'magic',
    'rare',
    'legendary'
);

CREATE TYPE equipment_slot AS ENUM (
    'weapon',
    'helm',
    'chest',
    'gloves',
    'boots',
    'amulet',
    'ring'
);

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    password_hash TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE characters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    class character_class NOT NULL DEFAULT 'wanderer',
    level INTEGER NOT NULL DEFAULT 1 CHECK (level >= 1),
    experience BIGINT NOT NULL DEFAULT 0 CHECK (experience >= 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE inventories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    character_id UUID NOT NULL UNIQUE REFERENCES characters(id) ON DELETE CASCADE,
    capacity INTEGER NOT NULL DEFAULT 40 CHECK (capacity > 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    inventory_id UUID NOT NULL REFERENCES inventories(id) ON DELETE CASCADE,
    item_key TEXT NOT NULL,
    name TEXT NOT NULL,
    rarity item_rarity NOT NULL DEFAULT 'common',
    item_level INTEGER NOT NULL DEFAULT 1 CHECK (item_level >= 1),
    slot equipment_slot,
    affixes JSONB NOT NULL DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_characters_user_id ON characters(user_id);
CREATE INDEX idx_items_inventory_id ON items(inventory_id);
CREATE INDEX idx_items_item_key ON items(item_key);
