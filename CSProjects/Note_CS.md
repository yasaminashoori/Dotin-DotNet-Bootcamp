# NOTES

### Session 1:

1. What is Enum: An enum is a special value type that lets you specify a group of named numeric constants.

Each enum member has an underlying integral value. These are by default:

- Underlying values are of type int.

- The constants 0, 1, 2... are automatically assigned, in the declaration order of the enum members.

You can specify an alternative integral type, as follows:

```
public enum BorderSide : byte { Left, Right, Top, Bottom }

```

You can also specify an explicit underlying value for each enum member:

```
public enum BorderSide : byte { Left=1, Right=2, Top=10, Bottom=11
}
```

The compiler also lets you explicitly assign some of the enum members. The unassigned enum members keep incrementing from the last explicit value. The preceding example is equivalent to the following:

```
public enum BorderSide : byte
{ Left=1, Right, Top=10, Bottom }

```
